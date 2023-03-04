# OpenapiClient::TeamLink

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The id of the &#x60;Team Link&#x60; |  |
| **scope** | [**TeamLinkScope**](TeamLinkScope.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |
| **team** | [**Team**](Team.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TeamLink.new(
  id: 100201,
  scope: null,
  _self: https://api.tempo.io/[...],
  team: null
)
```

