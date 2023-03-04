# OpenapiClient::GenericResourceTeamMembers

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Integer** | Count of &#x60;Generic Resource Team Members&#x60; in this team |  |
| **members** | [**Array&lt;GenericResourceReference&gt;**](GenericResourceReference.md) | A list of references to the the &#x60;Generic Resources&#x60; that are members of this team |  |
| **_self** | **String** | A permanent link to this resource |  |
| **team** | [**TeamReference**](TeamReference.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GenericResourceTeamMembers.new(
  count: 3,
  members: null,
  _self: https://api.tempo.io/[...],
  team: null
)
```

