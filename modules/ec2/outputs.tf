output "public_ips" {
    description = "Public IP of WordPress EC2 Instance"
    value = aws_instance.this[*].public_ip
}