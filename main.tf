module "organization" {
  source  = "BrynardSecurity-terraform/terraform-cloud/tfe"
  version = "0.0.5"
  # insert the 2 required variables here
  admin_email         = var.admin_email
  name                = var.organization_name
  create_organization = var.create_organization
}

output "organization_id" {
  value = module.organization.tfe_organization_id
}

module "oauth_client" {
  source                = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_oauth_client"
  version               = "0.0.5"
  depends_on            = [module.organization]
  api_url               = var.api_url
  https_url             = var.https_url
  oauth_token           = var.github_pat_token
  organization          = module.organization.tfe_organization_id
  service_provider      = var.service_provider
  tfe_oauth_client_name = "Terraform Cloud (${var.organization_name})"
}

output "oauth_client_id" {
  value = module.oauth_client.id
}
