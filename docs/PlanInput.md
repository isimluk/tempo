# OpenapiClient::PlanInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **assignee_id** | **String** | The id of the &#x60;Assignee&#x60; for the &#x60;Plan&#x60;. |  |
| **assignee_type** | **String** | The type of the &#x60;Assignee&#x60; for the &#x60;Plan&#x60;. |  |
| **description** | **String** | A description containing details of the &#x60;Plan&#x60;. | [optional] |
| **end_date** | **String** | The ending date of the &#x60;Plan&#x60;. |  |
| **include_non_working_days** | **Boolean** | Boolean value that informs whether non-working days are included in the &#x60;Plan&#x60;. | [optional] |
| **plan_approval** | [**PlanApprovalInput**](PlanApprovalInput.md) |  | [optional] |
| **plan_item_id** | **String** | The id of the &#x60;Plan Item&#x60; for the &#x60;Plan&#x60;. |  |
| **plan_item_type** | **String** | The type of the &#x60;Plan Item&#x60; for the &#x60;Plan&#x60;. |  |
| **planned_seconds_per_day** | **Integer** | The amount of seconds that will be invested daily on the &#x60;Plan&#x60;. |  |
| **recurrence_end_date** | **String** | End date for the recurrence of the &#x60;Plan&#x60;. | [optional] |
| **rule** | **String** | Recurrence rule of the &#x60;Plan&#x60;. | [optional] |
| **start_date** | **String** | The starting date of the &#x60;Plan&#x60;. |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PlanInput.new(
  assignee_id: 123456:01234567-89ab-cdef-0123-456789abcdef,
  assignee_type: USER,
  description: I will do some tests on this task tomorrow,
  end_date: 2022-05-17,
  include_non_working_days: true,
  plan_approval: null,
  plan_item_id: 598,
  plan_item_type: ISSUE,
  planned_seconds_per_day: 28800,
  recurrence_end_date: 2020-05-17,
  rule: WEEKLY,
  start_date: 2022-05-17
)
```

