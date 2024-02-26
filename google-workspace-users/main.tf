resource "googleworkspace_user" "user" {
  dynamic "name" {
    for_each = var.name
    content {
      given_name  = name.value.given_name
      family_name = name.value.family_name
    }
  }

  dynamic "emails" {
    for_each = var.emails
    content {
      address = emails.value.address
      primary = emails.value.primary
      type    = emails.value.type
    }
  }
  primary_email  = var.primary_email
  password       = var.password
  org_unit_path  = var.org_unit_path
  recovery_phone = var.recovery_phone

  dynamic "organizations" {
    for_each = var.organizations
    content {
      type        = organizations.value.type
      cost_center = organizations.value.cost_center
      department  = organizations.value.department
      description = organizations.value.description
      primary     = organizations.value.primary
      title       = organizations.value.title
    }
  }

  dynamic "relations" {
    for_each = var.relations
    content {
      type  = relations.value.type
      value = relations.value.value
    }
  }

  dynamic "locations" {
    for_each = var.locations
    content {
      area        = locations.value.area
      building_id = locations.value.building_id
      floor_name  = locations.value.floor_name
      type        = locations.value.type
    }
  }

  change_password_at_next_login = var.change_password_at_next_login
  suspended                     = var.suspended

}