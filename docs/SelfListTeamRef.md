# OpenapiClient::SelfListTeamRef

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **_self** | **String** | A permanent link to this resource |  |
| **values** | [**Array&lt;TeamRef&gt;**](TeamRef.md) | A group of links referencing this resource | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SelfListTeamRef.new(
  _self: https://api.tempo.io/[...],
  values: null
)
```

