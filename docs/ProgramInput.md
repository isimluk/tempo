# OpenapiClient::ProgramInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **manager_account_id** | **String** | The key of the Manager Account | [optional] |
| **name** | **String** | Name of the Program |  |
| **team_ids** | **Array&lt;Integer&gt;** | The list of keys of Teams associated to the &#x60;Program&#x60; | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ProgramInput.new(
  manager_account_id: 123456:01234567-89ab-cdef-0123-456789abcdef,
  name: Program: new Season,
  team_ids: [1,4,6,8]
)
```

