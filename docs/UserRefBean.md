# OpenapiClient::UserRefBean

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | A unique identifier of the user in Jira | [optional] |
| **_self** | **String** | A permanent link to this resource | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::UserRefBean.new(
  account_id: 123456:01234567-89ab-cdef-0123-456789abcdef,
  _self: https://api.tempo.io/[...]
)
```

