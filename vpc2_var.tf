variable "subnet_a_cidr_block" {
  type    = string
  default = "10.1.25.0/24"
}

variable "subnet_b_cidr_block" {
  type    = string
  default = "10.1.26.0/24"
}

variable "subnet_a_az" {
  type    = string
  default = "us-east-1a"
}

variable "subnet_b_az" {
  type    = string
  default = "us-east-1b"
}

variable "sg_name_prefix" {
  type    = string
  default = "ec-sg"
}

variable "sg_from_port" {
  type    = number
  default = 0
}

variable "sg_to_port" {
  type    = number
  default = 65535
}

variable "sg_protocol" {
  type    = string
  default = "tcp"
}

variable "sg_cidr_block" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

