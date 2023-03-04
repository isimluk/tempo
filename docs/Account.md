# OpenapiClient::Account

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **category** | [**Category**](Category.md) |  | [optional] |
| **contact** | [**UserContact**](UserContact.md) |  | [optional] |
| **customer** | [**Customer**](Customer.md) |  | [optional] |
| **global** | **Boolean** | Is the &#x60;Account&#x60; a global account or not |  |
| **id** | **Integer** | The id of the &#x60;Account&#x60; |  |
| **key** | **String** | The key of the &#x60;Account&#x60; |  |
| **lead** | [**AccountUser**](AccountUser.md) |  |  |
| **links** | [**ModelSelf**](ModelSelf.md) |  |  |
| **monthly_budget** | **Integer** | The estimated budget for the month | [optional] |
| **name** | **String** | The name of the &#x60;Account&#x60; |  |
| **_self** | **String** | A permanent link to this resource |  |
| **status** | **String** | The status of the &#x60;Account&#x60; |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Account.new(
  category: null,
  contact: null,
  customer: null,
  global: false,
  id: 7,
  key: CLOUDBAY_DEVELOPMENT,
  lead: null,
  links: null,
  monthly_budget: 600,
  name: Cloudbay: Development,
  _self: https://api.tempo.io/[...],
  status: OPEN
)
```

