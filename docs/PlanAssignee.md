# OpenapiClient::PlanAssignee

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The id of the &#x60;Assignee&#x60;. | [optional] |
| **_self** | **String** | A permanent link to this resource |  |
| **type** | **String** | The type of the &#x60;Assignee&#x60;. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PlanAssignee.new(
  id: 123456:01234567-89ab-cdef-0123-456789abcdef,
  _self: https://api.tempo.io/[...],
  type: USER
)
```

