variable "az" {
    description = "avalability zone"
    type = list(string)
}

variable "vpc_cidr" {
    description = "vpc cidr block"
    type = string

}

variable "pub_cidrs" {
    description = "public cidr block"
    type = list(string)
}

variable "public_subnet" {
    description = "public subnets"
    type = list(string)
}

variable "privatecidrs" {
    description = "private cidr block"
    type = list(string)
}

variable "private_subnet" {
    description = "private subnets"
    type = list(string)
}    