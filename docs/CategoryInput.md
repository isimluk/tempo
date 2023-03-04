# OpenapiClient::CategoryInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** | A set of characters that uniquely identify the category |  |
| **name** | **String** | The name of the category |  |
| **type_name** | **String** | The type of the category | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::CategoryInput.new(
  key: CLOUDBAY_DEVELOPMENT,
  name: Cloudbay: Development,
  type_name: BILLABLE
)
```

