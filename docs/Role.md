# OpenapiClient::Role

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **default** | **Boolean** | Boolean value that informs if this is a default &#x60;Role&#x60; |  |
| **id** | **Integer** | The id of the &#x60;Role&#x60; |  |
| **name** | **String** | The name of the &#x60;Role&#x60; |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Role.new(
  default: true,
  id: 126,
  name: Developer,
  _self: https://api.tempo.io/[...]
)
```

