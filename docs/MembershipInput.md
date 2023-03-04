# OpenapiClient::MembershipInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **commitment_percent** | **Integer** |  | [optional] |
| **from** | **Date** | The start date of the &#x60;Membership&#x60; | [optional] |
| **role_id** | **Integer** | The Role Id of the &#x60;Membership&#x60; | [optional] |
| **to** | **Date** | The end date of the &#x60;Membership&#x60; | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MembershipInput.new(
  commitment_percent: null,
  from: null,
  role_id: 2,
  to: null
)
```

