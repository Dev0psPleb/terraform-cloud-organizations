module "global_var_set" {
  source  = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_variable_set"
  version = "0.0.9"
  # insert the 4 required variables here
  depends_on               = [module.workspace]
  create_variable_set      = true
  global                   = true
  organization             = module.organization.tfe_organization_id
  variable_set_description = <<-EOT
    Variable set contains global variables for all workspaces in this organization.
    EOT
  variable_set_name        = "global_variables"
  workspace_ids            = null
}

data "tfe_workspace_ids" "prod" {
  name      = modue.organization.tfe_organization_id
  tag_names = ["prod"]
}

module "workspace_var_set" {
  source                   = "BrynardSecurity-terraform/terraform-cloud/tfe//module/tfe_variable_set"
  version                  = "0.0.9"
  depends_on               = [module.workspace]
  create_variable_set      = true
  organization             = module.organization.tfe_organization_id
  variable_set_description = <<-EOT
    Variable set contains workspace variables for "prod" tagged workspaces
    EOT
  variable_set_name        = var.workspace[0].name
  workspace_ids            = values(data.tfe_workspace_ids.prod.ids)
}
