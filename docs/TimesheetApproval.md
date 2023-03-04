# OpenapiClient::TimesheetApproval

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **actions** | [**TimesheetApprovalAvailableActions**](TimesheetApprovalAvailableActions.md) |  |  |
| **period** | [**TimesheetApprovalPeriod**](TimesheetApprovalPeriod.md) |  |  |
| **required_seconds** | **Integer** | The mandatory seconds spent on this timesheet |  |
| **reviewer** | [**TimesheetApprovalReviewer**](TimesheetApprovalReviewer.md) |  | [optional] |
| **_self** | **String** | A permanent link to this resource |  |
| **status** | [**TimesheetApprovalStatus**](TimesheetApprovalStatus.md) |  | [optional] |
| **time_spent_seconds** | **Integer** | The total seconds spent on this timesheet |  |
| **user** | [**TimesheetApprovalUser**](TimesheetApprovalUser.md) |  |  |
| **worklogs** | [**SelfApiBean**](SelfApiBean.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TimesheetApproval.new(
  actions: null,
  period: null,
  required_seconds: 633600,
  reviewer: null,
  _self: https://api.tempo.io/[...],
  status: null,
  time_spent_seconds: 633600,
  user: null,
  worklogs: null
)
```

