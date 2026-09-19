variable "kv_name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "kv_secret_name" {
  type = string
}

variable "kv_secret_value" {
  type = string
  sensitive = true
}