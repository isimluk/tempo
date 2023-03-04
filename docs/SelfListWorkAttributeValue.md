# OpenapiClient::SelfListWorkAttributeValue

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **_self** | **String** | A permanent link to this resource |  |
| **values** | [**Array&lt;WorkAttributeValue&gt;**](WorkAttributeValue.md) | A group of links referencing this resource | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SelfListWorkAttributeValue.new(
  _self: https://api.tempo.io/[...],
  values: null
)
```

