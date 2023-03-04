# OpenapiClient::TeamMembership

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **commitment_percent** | **Integer** | The commitment of the &#x60;Membership&#x60; | [optional] |
| **from** | **Date** | The start date of the &#x60;Membership&#x60; | [optional] |
| **id** | **Integer** | The id of the &#x60;Membership&#x60; | [optional] |
| **member** | [**TeamMember**](TeamMember.md) |  | [optional] |
| **role** | [**RoleReference**](RoleReference.md) |  | [optional] |
| **_self** | **String** | A permanent link to this resource |  |
| **team** | [**TeamRef**](TeamRef.md) |  | [optional] |
| **to** | **Date** | The end date of the &#x60;Membership&#x60; | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TeamMembership.new(
  commitment_percent: 50,
  from: null,
  id: 2,
  member: null,
  role: null,
  _self: https://api.tempo.io/[...],
  team: null,
  to: null
)
```

