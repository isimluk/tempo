# OpenapiClient::SkillsAssignmentInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **assignee_id** | **String** | A set of characters that uniquely identify a resource |  |
| **assignee_type** | **String** | A string that identify the resource type |  |
| **skill_ids** | **Array&lt;Integer&gt;** | A list of &#x60;Skill&#x60; ids | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SkillsAssignmentInput.new(
  assignee_id: 123456:01234567-89ab-cdef-0123-456789abcdef | 5,
  assignee_type: USER,
  skill_ids: [1,2,3,4,5]
)
```

