# OpenapiClient::TimesheetApprovalStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **actor** | [**TimesheetApprovalActor**](TimesheetApprovalActor.md) |  | [optional] |
| **comment** | **String** | The comment to request timesheet approval | [optional] |
| **key** | **String** |  | [optional] |
| **required_seconds_at_submit** | **Integer** | The mandatory seconds spent on this timesheet | [optional] |
| **time_spent_seconds_at_submit** | **Integer** | The total seconds spent on this timesheet | [optional] |
| **updated_at** | **String** | The last date time when this timesheet was modified | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TimesheetApprovalStatus.new(
  actor: null,
  comment: Hey, do it now!,
  key: null,
  required_seconds_at_submit: 633600,
  time_spent_seconds_at_submit: 633600,
  updated_at: 2022-01-01
)
```

