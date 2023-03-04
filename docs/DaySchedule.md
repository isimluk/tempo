# OpenapiClient::DaySchedule

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** | The date of the schedule |  |
| **holiday** | [**Holiday**](Holiday.md) |  | [optional] |
| **required_seconds** | **Integer** | The amount of seconds required in this schedule |  |
| **type** | **String** | The type of schedule. |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::DaySchedule.new(
  date: null,
  holiday: null,
  required_seconds: 0,
  type: null
)
```

