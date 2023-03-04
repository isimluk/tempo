# OpenapiClient::WorkAttributeValuesInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **attribute_values** | [**Array&lt;WorkAttributeValueInput&gt;**](WorkAttributeValueInput.md) | The list of work attribute |  |
| **tempo_worklog_id** | **Integer** | The worklog id in tempo app&#x60; |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::WorkAttributeValuesInput.new(
  attribute_values: null,
  tempo_worklog_id: 128
)
```

