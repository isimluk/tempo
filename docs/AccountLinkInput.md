# OpenapiClient::AccountLinkInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_key** | **String** | A set of character that uniquely identify an &#x60;Account&#x60; |  |
| **default** | **Boolean** | An optional boolean to indicate if the account link is the default for the project | [optional] |
| **scope_id** | **Integer** | The id of the scope |  |
| **scope_type** | **String** | The type of scope the &#x60;Account&#x60; is linked to |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AccountLinkInput.new(
  account_key: CLOUDBAY_DEVELOPMENT,
  default: true,
  scope_id: 100100,
  scope_type: PROJECT
)
```

