# terraform

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_oauth_client"></a> [oauth\_client](#module\_oauth\_client) | BrynardSecurity-terraform/terraform-cloud/tfe//modules/tfe_oauth_client | 0.0.5 |
| <a name="module_organization"></a> [organization](#module\_organization) | BrynardSecurity-terraform/terraform-cloud/tfe | 0.0.5 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | Email address to use for the organization admin | `string` | n/a | yes |
| <a name="input_api_url"></a> [api\_url](#input\_api\_url) | VCS API Url. EG: https://api.github.com | `string` | `"https://api.github.com"` | no |
| <a name="input_create_organization"></a> [create\_organization](#input\_create\_organization) | Whether or not to create the Terraform Cloud Organizatio | `bool` | n/a | yes |
| <a name="input_github_pat_token"></a> [github\_pat\_token](#input\_github\_pat\_token) | Github Personal Access Token | `string` | n/a | yes |
| <a name="input_https_url"></a> [https\_url](#input\_https\_url) | VCS HTTPS URL. EG: https://github.com | `string` | `"https://github.com"` | no |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Name of the Terraform Cloud Organization to create | `string` | n/a | yes |
| <a name="input_service_provider"></a> [service\_provider](#input\_service\_provider) | (Required) The VCS provider being connected with. Valid options are ado\_server, ado\_services, bitbucket\_hosted, bitbucket\_server, github, github\_enterprise, gitlab\_hosted, gitlab\_community\_edition, or gitlab\_enterprise\_edition. | `string` | `"github"` | no |
| <a name="input_terraform_api_token"></a> [terraform\_api\_token](#input\_terraform\_api\_token) | Terraform Cloud API Token | `string` | n/a | yes |
| <a name="input_variable"></a> [variable](#input\_variable) | Map of terraform variables | <pre>map(object({<br>    create_variable = bool<br>    key             = string<br>    value           = string<br>    description     = string<br>    category        = string<br>    sensitive       = bool<br>    hcl             = bool<br>    workspace_id    = string<br>  }))</pre> | `{}` | no |
| <a name="input_workspace"></a> [workspace](#input\_workspace) | Mapped variables for Terraform Workspaces | <pre>map(object({<br>    add_vcs_repo                  = bool<br>    agent_pool_id                 = string<br>    allow_destroy_plan            = bool<br>    auto_apply                    = bool<br>    create_variable_set           = bool<br>    execution_mode                = string<br>    file_triggers_enabled         = bool<br>    global                        = bool<br>    global_remote_state           = bool<br>    name                          = string<br>    oauth_token_id                = string<br>    organization                  = string<br>    queue_all_runs                = bool<br>    remote_state_consumer_ids     = string<br>    speculative_enabled           = bool<br>    structured_run_output_enabled = bool<br>    ssh_key_id                    = string<br>    terraform_version             = string<br>    tfe_token                     = string<br>    trigger_prefixes              = list(string)<br>    tags                          = list(string)<br>    vcs_branch                    = string<br>    vcs_repository                = string<br>    workspace_description         = string<br>    working_directory             = string<br>    workspace_variable            = bool<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oauth_client_id"></a> [oauth\_client\_id](#output\_oauth\_client\_id) | n/a |
| <a name="output_organization"></a> [organization](#output\_organization) | n/a |
| <a name="output_organization_id"></a> [organization\_id](#output\_organization\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
