resource "aws_security_group" "web_sg" {
  name = "wordpress-web-sg"
  description = "Allow HTTP, HTTPS, and SSH"
  vpc_id = var.vpc_id 

  #inbound rules
  ingress {
    description = "Allow SSH from my IP ONLY"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.my_ip
  }

  ingress {
    description = "Allow HTTP traffic"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS traffic"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outbound rules (allow all)
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wordpress-web-sg"
  }
}