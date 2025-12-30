resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "wordpress-vpc"
  }
}

resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id
    tags = {
        Name = "word-press-igw"
        automated = "yes"
    }    
        
} 

resource "aws_subnet" "public-subnets" {
    count = 2
    vpc_id = aws_vpc.this.id
    cidr_block = element((var.pub_cidrs), count.index)
    availability_zone = element((var.az), count.index)
    map_public_ip_on_launch = true

     tags = {
        Name = "${element(var.public_subnet, count.index)}"
     }
}

resource "aws_subnet" "private-subnets" {
   count = 2
    vpc_id = aws_vpc.this.id
    availability_zone = element((var.az), count.index) 
    cidr_block = element((var.privatecidrs), count.index)
   
    tags = {
        Name = "${element(var.private_subnet, count.index)}"
    }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "wordpress-public-route-table"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "wordpress-private-rt"
  }
}


resource "aws_route_table_association" "public-rt" {
    count = length(aws_subnet.public-subnets)
    subnet_id = element((aws_subnet.public-subnets.*.id), count.index)
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private-rt" {
    count = length(aws_subnet.private-subnets)
    subnet_id = element((aws_subnet.private-subnets.*.id), count.index)
    route_table_id = aws_route_table.private_rt.id
}