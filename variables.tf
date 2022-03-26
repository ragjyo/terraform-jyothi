variable "cidr_block" {
    type =  string
    default = "10.0.0.0/16"
}

variable "instance_tenancy" {
    type = string
    default = "default"

}

variable "enable_dns_support" {
    type = string
    default = "true"
}

variable "enable_dns_hostnames" {

        type = string
        default = "true"

}

variable "created_by" {
    type = string
    default = "siva"
}

variable "Environment" {
    type = string
    default = "dev"
}
