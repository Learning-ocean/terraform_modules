
variable "environment" {
  description = "Environment Name"
  type        = string
}

variable "app_name"{
  description = "Application Name"
  type        = string
}

variable "instance_size"{
  description = "instance size"
  type = string
  default = "t2.micro"
}

# variable "servers_name" {
#   description = "name of servers that we are going to deploy."
#   type        = list(string)
#   # default     = ["webserver-dev"]
# }

variable "ports" {
  type        = any
  description = "ports details."
}

variable "key_path" {
  description = "your public ssh key path"
  type        = string
  # default     = "./id_rsa.pub"
  validation {
    condition     = fileexists(var.key_path)
    error_message = "Public SSH key not found"
  }
}

variable "private_key_path" { 
  description = "your private ssh key path"
  type        = string
  # default     = "./id_rsa.pub"
  validation {
    condition     = fileexists(var.private_key_path)
    error_message = "Private SSH key not found"
  }
}

variable "bootstrap_script" {
  type        = string
  description = "shell script file path"
  # default     = "./id_rsa.pub"
  validation {
    condition     = fileexists(var.bootstrap_script)
    error_message = "bootstrap script not not found" 
  }
}

variable "project_files" { 
  description = "enter your project folder path"
  type        = string
  default     = "../src/"
}

variable "project_destination" { 
  description = "enter your project folder path on server"
  type        = string
  default     = "/var/www/html/"
}