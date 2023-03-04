# OpenapiClient::Customer

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The id of the &#x60;Customer&#x60; |  |
| **key** | **String** | The key of the &#x60;Customer&#x60; |  |
| **name** | **String** | The name of the &#x60;Customer&#x60; |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Customer.new(
  id: 234,
  key: CLOUDBAY_DEVELOPMENT,
  name: Cloudbay: Development,
  _self: https://api.tempo.io/[...]
)
```

