# OpenapiClient::PlanApproval

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reviewer** | [**User**](User.md) |  | [optional] |
| **status** | **String** | The status of the &#x60;PlanApproval&#x60;. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PlanApproval.new(
  reviewer: null,
  status: APPROVED
)
```

