# Google Workspace User Module

A Terraform module that creates and manages a user in Google Workspace, using the
[`hashicorp/googleworkspace`](https://registry.terraform.io/providers/hashicorp/googleworkspace/latest/docs)
provider.

It wraps the `googleworkspace_user` resource so each new account (name, email,
organizational unit, job title, manager, desk location) can be added with a short
module block instead of repeating the full resource.

## Requirements

| Name                      | Version  |
| ------------------------- | -------- |
| `hashicorp/googleworkspace` | `0.7.0`  |
| `hashicorp/google`          | `~> 4.0` |

The `googleworkspace` provider must be configured in the calling root module with an
account that has admin rights in your Workspace (for example, a service account with
domain-wide delegation).

## Usage

```hcl
module "user_jane" {
  source = "github.com/sintiasnn/google-workspace-user-module//google-workspace-users"

  name = [{
    given_name  = "Jane"
    family_name = "Doe"
  }]

  primary_email  = "jane.doe@example.com"
  password       = var.jane_initial_password
  org_unit_path  = "/Engineering"
  recovery_phone = "+620000000000"

  organizations = [{
    type        = "work"
    cost_center = "ENG"
    department  = "Engineering"
    description = "Platform team"
    primary     = true
    title       = "DevOps Engineer"
  }]

  relations = [{
    type  = "manager"
    value = "lead@example.com"
  }]
}
```

By default the user must change the password at first login
(`change_password_at_next_login = true`).

## Inputs

| Name                            | Type           | Required | Description                                                   |
| ------------------------------- | -------------- | -------- | ------------------------------------------------------------- |
| `name`                          | list(object)   | yes      | `given_name` and `family_name` of the user                    |
| `primary_email`                 | string         | yes      | Primary email address of the account                          |
| `password`                      | string         | yes      | Initial password                                              |
| `org_unit_path`                 | string         | yes      | Organizational unit, for example `/Engineering`               |
| `recovery_phone`                | string         | yes      | Recovery phone number in E.164 format                         |
| `emails`                        | list(object)   | no       | Extra email addresses (`address`, `primary`, `type`)          |
| `organizations`                 | list(object)   | no       | Job details: `title`, `department`, `cost_center`, and others |
| `relations`                     | list(object)   | no       | Relations such as the user's `manager`                        |
| `locations`                     | list(object)   | no       | Desk location: `area`, `building_id`, `floor_name`            |
| `change_password_at_next_login` | bool           | no       | Force a password change at first login. Default `true`        |
| `suspended`                     | bool           | no       | Create the account as suspended. Default `false`              |

## Notes

- Keep the initial password out of version control. Pass it from a secret store or a
  `*.tfvars` file that is listed in `.gitignore`.
- The module has no outputs yet.
