# OpenapiClient::PlanItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The id of the Item |  |
| **_self** | **String** | A permanent link to this resource |  |
| **type** | **String** | The type of the &#x60;Plan Item&#x60; for the &#x60;Plan&#x60;. |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PlanItem.new(
  id: 598,
  _self: https://api.tempo.io/[...],
  type: ISSUE
)
```

