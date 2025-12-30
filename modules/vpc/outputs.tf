output "vpc_id"  { 
    value = aws_vpc.this.id 
}

output "public_subnet_ids" {
    description = "IDs of the public subnets" 
    value = aws_subnet.public-subnets[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private-subnets[*].id
}
