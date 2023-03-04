# OpenapiClient::AccountSearchInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **global** | **Boolean** | An optional boolean to indicate if the account should be global or not | [optional] |
| **ids** | **Array&lt;Integer&gt;** | A list of &#x60;Account&#x60; ids | [optional] |
| **keys** | **Array&lt;String&gt;** | A list of &#x60;Account&#x60; keys | [optional] |
| **statuses** | **Array&lt;String&gt;** | A list of &#x60;Account&#x60; statuses | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AccountSearchInput.new(
  global: true,
  ids: [1,2],
  keys: [&quot;CLOUDBAY_DEVELOPMENT&quot;],
  statuses: [&quot;OPEN&quot;,&quot;ARCHIVED&quot;]
)
```

