# OpenapiClient::TeamInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **lead_account_id** | **String** | The id of Lead Account related to the &#x60;Team&#x60; | [optional] |
| **name** | **String** | The &#x60;Team&#x60; name |  |
| **program_id** | **Integer** | The id of program related to the &#x60;Team&#x60; | [optional] |
| **public** | **Boolean** | Determine if this entity could be public | [optional][default to true] |
| **summary** | **String** | The summary of the &#x60;Team&#x60; | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TeamInput.new(
  lead_account_id: null,
  name: null,
  program_id: 132,
  public: null,
  summary: This team was created to help different areas of the company
)
```

