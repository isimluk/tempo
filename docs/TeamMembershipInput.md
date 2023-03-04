# OpenapiClient::TeamMembershipInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The account id of the &#x60;Member&#x60; |  |
| **commitment_percent** | **Integer** | The percentage of the &#x60;Commitment&#x60; | [optional] |
| **from** | **Date** | The start date of the &#x60;Membership&#x60; | [optional] |
| **role_id** | **Integer** | The role id of the &#x60;Member&#x60; | [optional] |
| **team_id** | **Integer** | The id of the &#x60;Team&#x60; |  |
| **to** | **Date** | The end date of the &#x60;Membership&#x60; | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TeamMembershipInput.new(
  account_id: 1111aaaa2222bbbb3333cccc,
  commitment_percent: 50,
  from: null,
  role_id: 2,
  team_id: 1,
  to: null
)
```

