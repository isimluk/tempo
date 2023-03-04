# OpenapiClient::GenericResourceReference

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The id of the &#x60;Generic Resource&#x60; |  |
| **name** | **String** | The name of the &#x60;Generic Resource&#x60; |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GenericResourceReference.new(
  id: 7,
  name: Backend Developer,
  _self: https://api.tempo.io/[...]
)
```

