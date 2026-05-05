variable "vpc_cidr" {
  type        = string
  description = "cidr range for vpc"
} 

variable "subnet_cidr" {
    description = "subnets cidr"
    type = list(string)
}

