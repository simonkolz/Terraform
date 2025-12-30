variable "ami_id" {
  type = string
  default = "ami-0a0ff88d0f3f85a14"
  description = "AMI ID for EC2 Instance"
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance"
  default     = "t3.micro"
}

variable "private_key_path" {
  type        = string
  description = "Local path to your PEM key file for SSH access (not used by Terraform directly)."
  default     = "~/Downloads/true.pem"
}

variable "key_name" {
  type        = string
  description = "Name of the existing EC2 key pair in AWS (used when launching the instance)"
  default     = "true"
}

variable "my_ip" {
  description = "my person public IP for SSH(stored in tfvars file)"
  type = list(string)
}

variable "az" {
    description = "avalability zone"
    default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
    type = list(string)
}

variable "vpc_cidr" {
    description = "vpc cidr block"
    default = "10.0.0.0/16"
    type = string

}

variable "pub_cidrs" {
    description = "public cidr block"
    default = ["10.0.1.0/24", "10.0.2.0/24"]
    type = list(string)
}

variable "public_subnet" {
    description = "public subnets"
    default = ["Public-Subnet-A", "Public-Subnet-B"] 
    type = list(string)
}

variable "privatecidrs" {
    description = "private cidr block"
    default = ["10.0.3.0/24", "10.0.4.0/24"]
    type = list(string)
}

variable "private_subnet" {
    description = "private subnets"
    default = ["Private-Subnet-A", "Private-Subnet-B"]
    type = list(string)
}    