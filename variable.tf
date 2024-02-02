variable "name" {
  type = list(object({
    given_name  = string
    family_name = string
  }))
}

variable "emails" {
  type = list(object({
    address = string
    primary = bool
    type    = string
  }))
  default = [{
    address = " "
    primary = true
    type    = "work"
  }]
}

variable "primary_email" {
  type = string
}

variable "password" {
  type = string
}

variable "org_unit_path" {
  type = string
}

variable "recovery_phone" {
  type = string
}

variable "organizations" {
  type = list(object({
    type        = string
    cost_center = string
    department  = string
    description = string
    primary     = bool
    title       = string
  }))
  default = [{
    type        = "work"
    cost_center = " "
    department  = " "
    description = " "
    primary     = true
    title       = " "
  }]
}

variable "relations" {
  type = list(object({
    type  = string
    value = string
  }))
  default = [{
    type  = "manager"
    value = " "
  }]
}

variable "locations" {
  type = list(object({
    area        = string
    building_id = string
    floor_name  = string
    type        = string
  }))
  default = [{
    area        = "desk"
    building_id = " "
    floor_name  = " "
    type        = "desk"
  }]
}


variable "change_password_at_next_login" {
  type    = bool
  default = true
}

variable "suspended" {
  type    = bool
  default = false
}
