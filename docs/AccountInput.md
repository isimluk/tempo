# OpenapiClient::AccountInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **category_key** | **String** | A set of characters that uniquely identify a category | [optional] |
| **contact_account_id** | **String** | &#39;accountId&#39; of the contact, if the contact is a registered Jira user | [optional] |
| **customer_key** | **String** | A set of characters that uniquely identify a customer | [optional] |
| **external_contact_name** | **String** | Name of the contact, if the contact is not a registered Jira user | [optional] |
| **global** | **Boolean** |  | [optional] |
| **key** | **String** | A set of character that uniquely identify the account |  |
| **lead_account_id** | **String** | &#39;accountId&#39; of the lead on the account |  |
| **monthly_budget** | **Integer** |  | [optional] |
| **name** | **String** | Name of the account |  |
| **status** | **String** | The status of the account |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AccountInput.new(
  category_key: Jdev1,
  contact_account_id: 111aaaa2222bbbb3333cccc,
  customer_key: cloudbay1,
  external_contact_name: John Brown,
  global: false,
  key: CLOUDBAY_DEVELOPMENT,
  lead_account_id: 123456:01234567-89ab-cdef-0123-456789abcdef,
  monthly_budget: 600,
  name: Cloudbay: Development,
  status: OPEN
)
```

