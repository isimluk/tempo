# OpenapiClient::GlobalConfiguration

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **allow_logging_on_closed_account** | **Boolean** | Boolean to inform if it is possible to login on closed account |  |
| **approval_period** | **String** | Shows if Timesheet approval periods are weekly or monthly. |  |
| **approval_week_start** | **Integer** | Shows the start day. 1 is monday, 7 is sunday. |  |
| **max_hours_per_day_per_user** | **Integer** | The max hours a user can work | [optional] |
| **number_of_days_allowed_into_future** | **Integer** | Shows how many days you can track time into the future. |  |
| **plan_approval_enabled** | **Boolean** | Boolean to inform if planning approval is enabled |  |
| **remaining_estimate_optional** | **Boolean** | Shows if remaining estimate is required when tracking time. |  |
| **start_and_end_times_enabled** | **Boolean** | Boolean to inform if start and end times should be used for logging time |  |
| **start_and_end_times_for_planning_enabled** | **Boolean** | Boolean to inform if start and end times should be used for planning time |  |
| **week_start** | **Integer** | 1 is monday, 7 is sunday |  |
| **worklog_description_optional** | **Boolean** | Shows if description is required when tracking time. |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GlobalConfiguration.new(
  allow_logging_on_closed_account: true,
  approval_period: WEEK,
  approval_week_start: 1,
  max_hours_per_day_per_user: 8,
  number_of_days_allowed_into_future: 90,
  plan_approval_enabled: true,
  remaining_estimate_optional: true,
  start_and_end_times_enabled: false,
  start_and_end_times_for_planning_enabled: true,
  week_start: 1,
  worklog_description_optional: true
)
```

