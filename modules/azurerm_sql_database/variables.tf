variable "database_name" {
  type = string
}

variable "server_id" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "S0"
}

variable "collation" {
  type    = string
  default = "SQL_Latin1_General_CP1_CI_AS"
}