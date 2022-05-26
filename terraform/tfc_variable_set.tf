data "tfe_workspace_ids" "all" {
  organization      = module.organization.tfe_organization_id
  names             = ["*"]
}

output "tfe_workspace_ids" {
  value = values(data.tfe_workspace_ids.all.ids)
}

module "workspace_var_set" {
  source                   = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_variable_set"
  version                  = "0.0.9"
  create_variable_set      = true
  global                   = null
  organization             = module.organization.tfe_organization_id
  variable_set_description = <<-EOT
    Variable set contains workspace variables for "prod" tagged workspaces
    EOT
  variable_set_name        = "prod_workspace_vars"
  workspace_ids            = values(data.tfe_workspace_ids.all.ids)
}

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