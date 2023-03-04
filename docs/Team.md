# OpenapiClient::Team

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The id of the &#x60;Team&#x60; |  |
| **lead** | [**TeamLead**](TeamLead.md) |  | [optional] |
| **links** | [**SelfLink**](SelfLink.md) |  |  |
| **members** | [**SelfMember**](SelfMember.md) |  |  |
| **name** | **String** | The Team&#39;s name |  |
| **permissions** | [**ModelSelf**](ModelSelf.md) |  |  |
| **program** | [**ProgramReference**](ProgramReference.md) |  | [optional] |
| **_self** | **String** | A permanent link to this resource |  |
| **summary** | **String** | Brief description of the &#x60;Team&#x60; | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Team.new(
  id: 123,
  lead: null,
  links: null,
  members: null,
  name: Team Alpha,
  permissions: null,
  program: null,
  _self: https://api.tempo.io/[...],
  summary: Team created to solve the challenges in the company
)
```

