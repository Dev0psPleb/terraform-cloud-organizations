variable "organization" {
  description = "Mapped variables for Terraform Cloud Organizations"
  type = map(object({
    organization_name   = string
    admin_email         = string
    create_organization = bool
  }))
}

module "organization" {
  source  = "BrynardSecurity-terraform/terraform-cloud/tfe"
  version = "0.0.3"
  # insert the 2 required variables here
  for_each            = var.organization
  admin_email         = each.value.admin_email
  name                = each.value.organization_name
  create_organization = each.value.create_organization
}
