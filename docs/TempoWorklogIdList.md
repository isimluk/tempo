# OpenapiClient::TempoWorklogIdList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tempo_worklog_ids** | **Array&lt;Integer&gt;** | A list of Tempo Worklog ids you want to retrieve the respective Jira Worklog ids |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TempoWorklogIdList.new(
  tempo_worklog_ids: [1,2,3,4,5]
)
```

