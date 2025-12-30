resource "aws_instance" "this" {
  count = length(var.public_subnet_id)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet_id[count.index]
  vpc_security_group_ids      = [var.web_sg_id]
  associate_public_ip_address = true

  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "terraform-wordpress-ubuntu"
  }
}