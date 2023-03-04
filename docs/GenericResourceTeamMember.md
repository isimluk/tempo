# OpenapiClient::GenericResourceTeamMember

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **assigned_to_team_at** | **String** | Timestamp (in UTC) of when this &#x60;Generic Resource&#x60; was added to this team |  |
| **assigned_to_team_by** | [**UserRefBean**](UserRefBean.md) |  |  |
| **member** | [**GenericResourceReference**](GenericResourceReference.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |
| **team** | [**TeamReference**](TeamReference.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GenericResourceTeamMember.new(
  assigned_to_team_at: 2022-02-22T15:09:00Z,
  assigned_to_team_by: null,
  member: null,
  _self: https://api.tempo.io/[...],
  team: null
)
```

