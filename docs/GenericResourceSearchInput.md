# OpenapiClient::GenericResourceSearchInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ids** | **Array&lt;Integer&gt;** | A list of &#x60;Generic Resource&#x60; ids | [optional] |
| **limit** | **Integer** | Maximum number of results on each page | [optional] |
| **offset** | **Integer** | Number of skipped results | [optional] |
| **query** | **String** | A query to be used for string matching against name of &#x60;Generic Resources&#x60; | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GenericResourceSearchInput.new(
  ids: [1,2],
  limit: 50,
  offset: 0,
  query: java
)
```

