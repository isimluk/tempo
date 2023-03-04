# OpenapiClient::AccountLink

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account** | [**ModelSelf**](ModelSelf.md) |  |  |
| **default** | **Boolean** | If the &#x60;AccountLink&#x60; is the default for the scope |  |
| **id** | **Integer** | The id of the &#x60;AccountLink&#x60; |  |
| **scope** | [**AccountLinkScope**](AccountLinkScope.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AccountLink.new(
  account: null,
  default: true,
  id: 1,
  scope: null,
  _self: https://api.tempo.io/[...]
)
```

