# OpenapiClient::UserContact

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | A unique identifier of the user in Jira |  |
| **_self** | **String** | A permanent link to this resource |  |
| **type** | **String** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::UserContact.new(
  account_id: 1111aaaa2222bbbb3333cccc,
  _self: https://api.tempo.io/[...],
  type: null
)
```

