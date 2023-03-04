# OpenapiClient::Plan

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **assignee** | [**PlanAssignee**](PlanAssignee.md) |  | [optional] |
| **description** | **String** | A description containing details of the &#x60;Plan&#x60;. | [optional] |
| **end_date** | **String** | The ending date of the &#x60;Plan&#x60;. | [optional] |
| **id** | **Integer** | The id of the &#x60;Plan&#x60;. | [optional] |
| **include_non_working_days** | **Boolean** | Boolean value that informs whether non-working days are included in the &#x60;Plan&#x60;. | [optional] |
| **plan_approval** | [**PlanApproval**](PlanApproval.md) |  | [optional] |
| **plan_item** | [**PlanItem**](PlanItem.md) |  | [optional] |
| **planned_seconds_per_day** | **Integer** | The amount of seconds that will be invested daily in the &#x60;Plan&#x60;. | [optional] |
| **planned_time** | [**PlannedTime**](PlannedTime.md) |  | [optional] |
| **recurrence_end_date** | **String** | End date for recurrence of the &#x60;Plan&#x60;. | [optional] |
| **rule** | **String** | Recurrence rule of the &#x60;Plan&#x60;. | [optional] |
| **_self** | **String** | A permanent link to this resource |  |
| **start_date** | **String** | The starting date of the &#x60;Plan&#x60;. | [optional] |
| **total_planned_seconds_in_scope** | **Integer** | The amount of seconds planned for on the entire &#x60;Plan&#x60; within the scope of the supplied &#x60;from&#x60; and &#x60;to&#x60; dates. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Plan.new(
  assignee: null,
  description: I will do some tests on this task tomorrow,
  end_date: 2022-05-17,
  id: 1,
  include_non_working_days: true,
  plan_approval: null,
  plan_item: null,
  planned_seconds_per_day: 28800,
  planned_time: null,
  recurrence_end_date: 2020-05-17,
  rule: WEEKLY,
  _self: https://api.tempo.io/[...],
  start_date: 2022-05-17,
  total_planned_seconds_in_scope: 28800
)
```

