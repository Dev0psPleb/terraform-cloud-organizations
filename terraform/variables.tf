variable "admin_email" {
  description = "Email address to use for the organization admin"
  type        = string
}

variable "api_url" {
  description = "VCS API Url. EG: https://api.github.com"
  type        = string
  default     = "https://api.github.com"
}

variable "create_organization" {
  description = "Whether or not to create the Terraform Cloud Organizatio"
  type        = bool
}

variable "github_pat_token" {
  description = "Github Personal Access Token"
  type        = string
  sensitive   = true
}

variable "https_url" {
  description = "VCS HTTPS URL. EG: https://github.com"
  type        = string
  default     = "https://github.com"
}

variable "organization_name" {
  description = "Name of the Terraform Cloud Organization to create"
  type        = string
}

variable "service_provider" {
  description = <<EOT
(Required) The VCS provider being connected with. Valid options are ado_server, ado_services, bitbucket_hosted, bitbucket_server, github, github_enterprise, gitlab_hosted, gitlab_community_edition, or gitlab_enterprise_edition.
  EOT
  type        = string
  default     = "github"
}

variable "terraform_api_token" {
  description = "Terraform Cloud API Token"
  type        = string
  sensitive   = true
}

variable "variable" {
  description = "Map of terraform variables"
  type = map(object({
    create_variable = bool
    key             = string
    value           = string
    description     = string
    category        = string
    sensitive       = bool
    hcl             = bool
    workspace_id    = string
  }))
  default = {}
}

variable "workspace" {
  description = "Mapped variables for Terraform Workspaces"
  type = map(object({
    add_vcs_repo                  = bool
    agent_pool_id                 = string
    allow_destroy_plan            = bool
    auto_apply                    = bool
    create_variable_set           = bool
    execution_mode                = string
    file_triggers_enabled         = bool
    global                        = bool
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
    tfe_token                     = string
    trigger_prefixes              = list(string)
    tags                          = list(string)
    vcs_branch                    = string
    vcs_repository                = string
    workspace_description         = string
    working_directory             = string
    workspace_variable            = bool
  }))
  default = {}
}
