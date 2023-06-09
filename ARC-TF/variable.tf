variable "region" {
  type = string
}

variable "vpc_cidir" {
  type = string
}

variable "pub_cidir" {
  type = list(string)
}

variable "pub_az" {
  type = list(string)
}

variable "name" {
  type = string
}

variable "prv_cidir" {
  type = string
}

variable "prv_az" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_count" {
  type = number
}

