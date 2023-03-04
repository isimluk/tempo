# OpenapiClient::PlanDay

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **String** | A date to represent a planned day for the &#x60;Plan&#x60;. |  |
| **planned_seconds** | **Integer** | The amount of seconds that will be invested in the &#x60;Plan&#x60; for the planned date. |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PlanDay.new(
  date: 2022-05-17,
  planned_seconds: 28800
)
```

