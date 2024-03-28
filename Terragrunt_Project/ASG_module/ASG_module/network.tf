#Create VPC 
resource "aws_vpc" "ASG_Docker_vpc" {
 cidr_block = var.vpc_cidr_block
 
 tags = {
   Name = "ASG_Docker_VPC"
 }
}


#Create subnets in different AZs for high availability
resource "aws_subnet" "public_subnets" {
 count      = length(var.public_subnet_cidrs)
 vpc_id     = aws_vpc.ASG_Docker_vpc.id
 cidr_block = element(var.public_subnet_cidrs, count.index)
 map_public_ip_on_launch = true
 
 tags = {
   Name = "ASG_Docker_Public_Subnet_${count.index + 1}"
 }
}


# Create an Internet Gateway
resource "aws_internet_gateway" "ASG_Docker_IG" {
  vpc_id = aws_vpc.ASG_Docker_vpc.id
  
  tags = {
    Name = "ASG_Docker_IGW"
  }
}

# Create a route table
resource "aws_route_table" "ASG_Docker_RT" {
  vpc_id = aws_vpc.ASG_Docker_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ASG_Docker_IG.id
  }
  
  tags = {
    Name = "ASG_Docker_RT"
  }
}

# Associate route table with subnets
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.ASG_Docker_RT.id
}