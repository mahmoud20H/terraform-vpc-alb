##################### variable of region ###################################
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1" # You can change this default value as needed
}
####################### VPC file ##############################################
# variables of vpc cidr
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/16" # You can change this default value
}
# variable of vpc name
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "terraform-vpc" # You can change this default value
}
##################### subnet file #############################################
######### Public Subnets
variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet"
  type        = string
  default     = "192.168.3.0/24" # Set your desired CIDR block here
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet"
  type        = string
  default     = "192.168.4.0/24" # Set your desired CIDR block here
}

variable "public_subnet_1_name" {
  description = "Name for the first public subnet"
  type        = string
  default     = "public-sub1" # You can change this default value
}

variable "public_subnet_2_name" {
  description = "Name for the second public subnet"
  type        = string
  default     = "public-sub2" # You can change this default value
}

########## Private Subnets
variable "private_subnet_1_cidr" {
  description = "CIDR block for the first private subnet"
  type        = string
  default     = "192.168.1.0/24" # Set your desired CIDR block here
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the second private subnet"
  type        = string
  default     = "192.168.2.0/24" # Set your desired CIDR block here
}

variable "private_subnet_1_name" {
  description = "Name for the first private subnet"
  type        = string
  default     = "private-sub1" # You can change this default value
}

variable "private_subnet_2_name" {
  description = "Name for the second private subnet"
  type        = string
  default     = "private-sub2" # You can change this default value
}
############## AZ
variable "subnet_1_az" {
  description = "Availability zone for the first  subnet"
  type        = string
  default     = "us-east-1a" # Set to us-east-1a
}

variable "subnet_2_az" {
  description = "Availability zone for the second  subnet"
  type        = string
  default     = "us-east-1b" # Set to us-east-1b
}
########################### jump file ###########################
variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
  default     = "ami-0182f373e66f89c85"
}

variable "instance_type" {
  description = "Instance type to use"
  type        = string
  default     = "t2.micro" # You can change the default value
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default     = "Jump_Server"
}
######################## NAT file ###############################
variable "nat_gateway_name" {
  description = "The name of the NAT Gateway"
  type        = string
  default     = "nat_gateway"
}
variable "igw_name" {
  description = "The name of the NAT Gateway"
  type        = string
  default     = "igw-default"
}
variable "public_cidr_block" {
  description = "CIDR block for the public route table"
  type        = string
  default     = "0.0.0.0/0"
}
############################## alb file #################################
variable "load_balancer_name" {
  description = "The name of the Application Load Balancer"
  type        = string
  default     = "alb-terraform"
}
