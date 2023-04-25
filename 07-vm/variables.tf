variable "project_id" {
  type        = string
  description = "Specifies the project id"
}

variable "region" {
  type        = string
  description = "Specifies the region to use"
}

variable "zone" {
  type        = string
  description = "Specifies the region to use"
}

variable "env" {
  type        = string
  description = "Specifies the region"
}

variable "vpc" {
  type = string
  description = "vpc name"
}

variable "filename" {
  type = string
  description = "file name"
}

variable "subnetwork" {
  type        = string
  description = "Specifies the subnetwork name "
}