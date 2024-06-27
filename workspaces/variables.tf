variable "instance_name" {
    type = string
    default = "Terraform"
}

variable "instance_type" {
    default = {
        dev = "t2.micro"
        prod = "t3.micro"
    } 
}