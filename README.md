# terraform-azurerm-cosmosdb

[![Build Status](https://github.com/JamesWoolfenden/terraform-azurerm-cosmosdb/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-azurerm-cosmosdb)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-azurerm-cosmosdb.svg)](https://github.com/JamesWoolfenden/terraform-azurerm-cosmosdb/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-azurerm-cosmosdb.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-azurerm-cosmosdb/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-azurerm-cosmosdb/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-azurerm-cosmosdb&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-azurerm-cosmosdb/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-azurerm-cosmosdb&benchmark=INFRASTRUCTURE+SECURITY)

Terraform module -

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

This is just a very basic example.

Include **module.cosmosdb.tf** this repository as a module in your existing terraform code:

```terraform
module "cosmosdb" {
  source         = "JamesWoolfenden/cosmosdb/azurerm"
  common_tags    = var.common_tags
  account_name      = var.account_name
  failover_location = var.failover_location
  key_vault_key     = azurerm_key_vault_key.generated
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_account.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |
| [azurerm_cosmosdb_table.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | n/a | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | This is to help you add tags to your cloud objects | `map(any)` | n/a | yes |
| <a name="input_failover_location"></a> [failover\_location](#input\_failover\_location) | n/a | `string` | n/a | yes |
| <a name="input_ip_range_filter"></a> [ip\_range\_filter](#input\_ip\_range\_filter) | n/a | `string` | `""` | no |
| <a name="input_key_vault_key"></a> [key\_vault\_key](#input\_key\_vault\_key) | n/a | `any` | n/a | yes |
| <a name="input_kind"></a> [kind](#input\_kind) | n/a | `string` | n/a | yes |
| <a name="input_offer_type"></a> [offer\_type](#input\_offer\_type) | n/a | `string` | `"Standard"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | n/a | `any` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | n/a | `list(any)` | `[]` | no |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | (optional) describe your variable | `string` | `"tfex-cosmos-table"` | no |
| <a name="input_throughput"></a> [throughput](#input\_throughput) | n/a | `number` | `400` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

This is the policy required to build this project:

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang

resource "azurerm_role_definition" "terraform_pike" {
  role_definition_id = local.uuid
  name               = "terraform_pike"
  scope              = data.azurerm_subscription.primary.id

  permissions {
    actions = [
    "Microsoft.DocumentDB/databaseAccounts/delete",
    "Microsoft.DocumentDB/databaseAccounts/listConnectionStrings/action",
    "Microsoft.DocumentDB/databaseAccounts/listKeys/action",
    "Microsoft.DocumentDB/databaseAccounts/read",
    "Microsoft.DocumentDB/databaseAccounts/readonlykeys/action",
    "Microsoft.DocumentDB/databaseAccounts/tables/delete",
    "Microsoft.DocumentDB/databaseAccounts/tables/read",
    "Microsoft.DocumentDB/databaseAccounts/tables/throughputSettings/read",
    "Microsoft.DocumentDB/databaseAccounts/tables/write",
    "Microsoft.DocumentDB/databaseAccounts/write",
    "Microsoft.Resources/subscriptions/resourcegroups/read"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
}

locals {
  uuid = uuid()
}

data "azurerm_subscription" "primary" {
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-azurerm-cosmosdb/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-azurerm-cosmosdb/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
