# OpenapiClient::GenericResource

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **created_at** | **String** | Timestamp (in UTC) of when this &#x60;Generic Resource&#x60; was created |  |
| **created_by** | [**UserRefBean**](UserRefBean.md) |  |  |
| **id** | **Integer** | The id of the &#x60;Generic Resource&#x60; |  |
| **name** | **String** | The name of the &#x60;Generic Resource&#x60; |  |
| **_self** | **String** | A permanent link to this resource |  |
| **updated_at** | **String** | Timestamp (in UTC) of when this &#x60;Generic Resource&#x60; was last updated |  |
| **updated_by** | [**UserRefBean**](UserRefBean.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GenericResource.new(
  created_at: 2022-02-22T15:09:00Z,
  created_by: null,
  id: 7,
  name: Backend Developer,
  _self: https://api.tempo.io/[...],
  updated_at: 2022-02-25T12:13:00Z,
  updated_by: null
)
```

