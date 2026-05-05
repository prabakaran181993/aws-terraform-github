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
  
  tags = {
    Name = "Main"
  }
}