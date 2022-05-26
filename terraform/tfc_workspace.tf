locals {
  oauth_token_id      = module.oauth_client.oauth_token_id
  organization        = module.organization.tfe_organization_id
  terraform_api_token = var.terraform_api_token
}

module "workspace" {
  source                        = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_workspace"
  version                       = "0.0.9"
  depends_on                    = [module.organization]
  for_each                      = var.workspace
  add_vcs_repo                  = each.value.add_vcs_repo
  agent_pool_id                 = each.value.agent_pool_id
  allow_destroy_plan            = each.value.allow_destroy_plan
  auto_apply                    = each.value.auto_apply
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
