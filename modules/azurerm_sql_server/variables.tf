variable "sql_server_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "admin_login" {
  type = string
}

variable "admin_pass" {
  type      = string
  sensitive = true
}
