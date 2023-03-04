# OpenapiClient::PlanPeriod

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **from** | **String** | The starting date of the &#x60;Period&#x60;. | [optional] |
| **planned_seconds** | **Integer** | Total planned seconds for the &#x60;Period&#x60;. | [optional] |
| **to** | **String** | The ending date of the &#x60;Period&#x60;. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PlanPeriod.new(
  from: 2022-05-17,
  planned_seconds: 28800,
  to: 2022-05-17
)
```

