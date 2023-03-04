# OpenapiClient::PageableMetadata

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Integer** | The number of results returned on this page |  |
| **limit** | **Integer** | Maximum number of results on each page |  |
| **_next** | **String** | A link to the next page of results, if applicable | [optional] |
| **offset** | **Integer** | Number of skipped results |  |
| **previous** | **String** | A link to the previous page of results, if applicable | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PageableMetadata.new(
  count: 1,
  limit: 50,
  _next: https://api.tempo.io/[...],
  offset: null,
  previous: https://api.tempo.io/[...]
)
```

