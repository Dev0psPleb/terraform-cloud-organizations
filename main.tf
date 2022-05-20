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

variable "workspace" {
  description = "Mapped variables for Terraform Cloud Workspaces"
  type = map(object({
    add_vcs_repo                  = bool
    agent_pool_id                 = string
    allow_destroy_plan            = bool
    auto_apply                    = bool
    create_variable_set           = bool
    execution_mode                = string
    file_triggers_enabled         = bool
    global_remote_state           = bool
    name                          = string
    oauth_token_id                = string
    organization                  = string
    queue_all_runs                = bool
    remote_state_consumer_ids     = string
    speculative_enabled           = bool
    structured_run_output_enabled = bool
    ssh_key_id                    = string
    terraform_version             = string
    trigger_prefixes              = list(string)
    tags                          = list(string)
    vcs_repository                = string
    workspace_description         = string
    working_directory             = string
    workspace_variable            = bool
  }))
}

module "workspace" {
  source  = "BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_workspace"
  version = "0.0.3"
  # insert the 2 required variables here
  for_each                      = var.workspace
  add_vcs_repo                  = each.value.add_vcs_repo
  allow_destroy_plan            = each.value.allow_destroy_plan
  auto_apply                    = each.value.auto_apply
  create_variable_set           = each.value.create_variable_set
  execution_mode                = each.value.execution_mode
  global_remote_state           = each.value.global_remote_state
  name                          = each.value.name
  oauth_token_id                = each.value.oauth_token_id
  organization                  = each.value.organization
  queue_all_runs                = each.value.queue_all_runs
  remote_state_consumer_ids     = [each.value.remote_state_consumer_ids]
  speculative_enabled           = each.value.speculative_enabled
  structured_run_output_enabled = each.value.structured_run_output_enabled
  ssh_key_id                    = each.value.ssh_key_id
  terraform_version             = each.value.terraform_version
  trigger_prefixes              = each.value.trigger_prefixes
  tags                          = each.value.tags
  vcs_repository                = each.value.vcs_repository
  workspace_description         = each.value.workspace_description
  working_directory             = each.value.working_directory
  workspace_variable            = each.value.workspace_variable
}
