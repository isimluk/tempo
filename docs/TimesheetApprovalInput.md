# OpenapiClient::TimesheetApprovalInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **comment** | **String** | The comment about timesheet to approval | [optional] |
| **reviewer_account_id** | **String** | The Account id of the reviewer | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TimesheetApprovalInput.new(
  comment: This is a generic comment about this timesheet.,
  reviewer_account_id: 123456:01234567-89ab-cdef-0123-456789abcdef
)
```

