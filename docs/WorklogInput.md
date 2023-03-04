# OpenapiClient::WorklogInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **attributes** | [**Array&lt;WorkAttributeValueInput&gt;**](WorkAttributeValueInput.md) | The list of work attribute of this &#x60;Worklog&#x60; | [optional] |
| **author_account_id** | **String** | The Account id of the user author |  |
| **billable_seconds** | **Integer** | The amount of seconds billable | [optional] |
| **description** | **String** | The description of the &#x60;Worklog&#x60; | [optional] |
| **issue_id** | **Integer** | The id of the issue associated to this worklog |  |
| **remaining_estimate_seconds** | **Integer** | The total amount of estimated remaining seconds&#x60; | [optional] |
| **start_date** | **Date** | The start date of the &#x60;Worklog&#x60; |  |
| **start_time** | **String** | The start time of the &#x60;Worklog&#x60; | [optional] |
| **time_spent_seconds** | **Integer** | The total amount of time spent in seconds&#x60; |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::WorklogInput.new(
  attributes: null,
  author_account_id: 1111aaaa2222bbbb3333cccc,
  billable_seconds: 100201,
  description: Investigating a problem with our external database system,
  issue_id: 10001,
  remaining_estimate_seconds: 120,
  start_date: null,
  start_time: 72360,
  time_spent_seconds: 3600
)
```

