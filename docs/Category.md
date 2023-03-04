# OpenapiClient::Category

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The id of the &#x60;Category&#x60; |  |
| **key** | **String** | The key of the &#x60;Category&#x60; |  |
| **name** | **String** | The name of the &#x60;Category&#x60; |  |
| **_self** | **String** | A permanent link to this resource |  |
| **type** | [**CategoryType**](CategoryType.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Category.new(
  id: 14,
  key: 300,
  name: Development,
  _self: https://api.tempo.io/[...],
  type: null
)
```

