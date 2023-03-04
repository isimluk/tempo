# OpenapiClient::RoleReference

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The id of the &#x60;Role&#x60; |  |
| **name** | **String** | The name of the &#x60;Role&#x60; |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::RoleReference.new(
  id: 2,
  name: Developer,
  _self: https://api.tempo.io/[...]
)
```

