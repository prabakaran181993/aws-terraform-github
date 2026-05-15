variable "vpc_cidr" {
  type        = string
  description = "cidr range for vpc"
} 

variable "subnet_cidr" {
    description = "subnets cidr"
    type = list(string)
}

variable "subnet_names" {
  description = "subnet names" 
  type = list(string)
  default = ["publicsubnet01", "publicsubnet02"]
}
