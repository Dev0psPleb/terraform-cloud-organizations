terraform {
  cloud {
    organization = "sophos-xdr"

    workspaces {
      name = "sophos-xdr"
    }
  }
}

module "organization" {
  source  = "BrynardSecurity-terraform/terraform-cloud/tfe"
  version = "0.0.5"
  # insert the 2 required variables here
  admin_email         = var.admin_email
  name                = var.organization_name
  create_organization = var.create_organization
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

locals {
  oauth_token_id      = module.oauth_client.oauth_token_id
  organization        = module.organization.tfe_organization_id
  terraform_api_token = var.terraform_api_token
}

module "workspace" {
  source                        = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_workspace"
  version                       = "0.0.5"
  depends_on                    = [module.organization]
  for_each                      = var.workspace
  add_vcs_repo                  = each.value.add_vcs_repo
  agent_pool_id                 = each.value.agent_pool_id
  allow_destroy_plan            = each.value.allow_destroy_plan
  auto_apply                    = each.value.auto_apply
  create_variable_set           = each.value.create_variable_set
  execution_mode                = each.value.execution_mode
  file_triggers_enabled         = each.value.file_triggers_enabled
  global                        = each.value.global
  global_remote_state           = each.value.global_remote_state
  name                          = each.value.name
  oauth_token_id                = local.oauth_token_id
  organization                  = local.organization
  queue_all_runs                = each.value.queue_all_runs
  remote_state_consumer_ids     = [each.value.remote_state_consumer_ids]
  speculative_enabled           = each.value.speculative_enabled
  structured_run_output_enabled = each.value.structured_run_output_enabled
  ssh_key_id                    = each.value.ssh_key_id
  terraform_version             = each.value.terraform_version
  tfe_token                     = local.terraform_api_token
  trigger_prefixes              = each.value.trigger_prefixes
  tags                          = each.value.tags
  vcs_branch                    = each.value.vcs_branch
  vcs_repository                = each.value.vcs_repository
  workspace_description         = each.value.workspace_description
  working_directory             = each.value.working_directory
  workspace_variable            = each.value.workspace_variable
}

data "tfe_workspace_ids" "all" {
  names        = ["*"]
  organization = module.organization.tfe_organization_id
}

module "variables" {
  source          = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_variables"
  version         = "0.0.5"
  depends_on      = [module.workspace]
  for_each        = var.variable
  create_variable = each.value.create_variable
  key             = each.value.key
  value           = each.value.value
  description     = each.value.description
  category        = each.value.category
  sensitive       = each.value.sensitive
  hcl             = each.value.hcl
  workspace_id    = each.value.workspace_id
}
