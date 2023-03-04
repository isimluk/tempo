# OpenapiClient::UpdateWorkAttributeInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of the &#x60;WorkAttribute&#x60; |  |
| **required** | **Boolean** | Whether this &#x60;WorkAttribute&#x60; is required. If not provided, the default value is &#x60;false&#x60; | [optional] |
| **type** | **String** | The type of the &#x60;WorkAttribute&#x60; |  |
| **values** | **Array&lt;String&gt;** | Only relevant when type is &#x60;STATIC_LIST&#x60;. These values are immutable. Their UI representation can be looked up in the &#x60;names&#x60; object below | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::UpdateWorkAttributeInput.new(
  name: Attr 1,
  required: false,
  type: STATIC_LIST,
  values: [&quot;Some Value&quot;]
)
```

