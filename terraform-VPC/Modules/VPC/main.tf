resource "aws_vpc" "test_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    tags = {
        "name" = "test_vpc"

    }
}

resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidr) 
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.subnet_cidr [count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  
  tags = {
    Name = var.subnet_names[count.index] 

  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    name = "migw"
  }
}

resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.test_vpc.id
  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "ras" {
  count = length (var.subnet_cidr)
  subnet_id = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.routetable.id

}