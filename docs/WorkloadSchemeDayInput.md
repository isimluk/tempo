# OpenapiClient::WorkloadSchemeDayInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **day** | **String** | The day of the week |  |
| **required_seconds** | **Integer** | The number of seconds required to be worked |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::WorkloadSchemeDayInput.new(
  day: WEDNESDAY,
  required_seconds: 14400
)
```

