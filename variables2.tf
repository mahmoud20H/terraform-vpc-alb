##### this variables for sg file only #######333
variable "http_ingress_from_port" {
  description = "Starting port for HTTP ingress rule"
  type        = number
  default     = 80
}

variable "http_ingress_to_port" {
  description = "Ending port for HTTP ingress rule"
  type        = number
  default     = 80
}

variable "http_ingress_protocol" {
  description = "Protocol for HTTP ingress rule"
  type        = string
  default     = "tcp"
}

variable "http_ingress_cidr_blocks" {
  description = "CIDR blocks for HTTP ingress rule"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "http_security_group_name" {
  description = "The name of the HTTP security group"
  type        = string
  default     = "HTTP-SG"
}

variable "ssh_ingress_from_port" {
  description = "Starting port for SSH ingress rule"
  type        = number
  default     = 22
}

variable "ssh_ingress_to_port" {
  description = "Ending port for SSH ingress rule"
  type        = number
  default     = 22
}

variable "ssh_ingress_protocol" {
  description = "Protocol for SSH ingress rule"
  type        = string
  default     = "tcp"
}

variable "ssh_ingress_cidr_blocks" {
  description = "CIDR blocks for SSH ingress rule"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "jumper_ssh_ingress_from_port" {
  description = "Starting port for SSH ingress rule in jumper SG"
  type        = number
  default     = 22
}

variable "jumper_ssh_ingress_to_port" {
  description = "Ending port for SSH ingress rule in jumper SG"
  type        = number
  default     = 22
}

variable "jumper_ssh_ingress_protocol" {
  description = "Protocol for SSH ingress rule in jumper SG"
  type        = string
  default     = "tcp"
}

variable "jumper_ssh_ingress_cidr_blocks" {
  description = "CIDR blocks for SSH ingress rule in jumper SG"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "jumper_security_group_name" {
  description = "The name of the jumper security group"
  type        = string
  default     = "jumper-SG"
}
