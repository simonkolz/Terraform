variable "ami_id" {
  type = string
  description = "AMI ID for EC2 Instance"
}

variable "instance_type" {
  type = string
  description = "EC2 Instance type"
}

variable "public_subnet_id" {
  type = list(string)
  description = "Subnet where EC2 will be launched"
}

variable "web_sg_id" {
  type = string
  description = "Security Group ID for web server"
}

variable "key_name" {
  type = string
  description = "Name of EC2 key pair"
}