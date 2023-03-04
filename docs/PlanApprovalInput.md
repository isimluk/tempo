# OpenapiClient::PlanApprovalInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reviewer_id** | **String** | A unique identifier of the user in Jira who will review this &#x60;PlanApproval&#x60;. | [optional] |
| **status** | **String** | The status of the &#x60;PlanApproval&#x60;. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PlanApprovalInput.new(
  reviewer_id: 123456:01234567-89ab-cdef-0123-456789abcdef,
  status: APPROVED
)
```

