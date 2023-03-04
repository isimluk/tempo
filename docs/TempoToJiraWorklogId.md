# OpenapiClient::TempoToJiraWorklogId

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **jira_worklog_id** | **Integer** | A unique identifier of the Worklog in Jira |  |
| **tempo_worklog_id** | **Integer** | A unique identifier of the Worklog in Tempo |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TempoToJiraWorklogId.new(
  jira_worklog_id: 12345,
  tempo_worklog_id: 12345
)
```

