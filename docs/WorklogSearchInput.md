# OpenapiClient::WorklogSearchInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **author_ids** | **Array&lt;String&gt;** | Ids of the authors you want to search worklogs for. | [optional] |
| **from** | **String** | Retrieve worklogs starting with this date. | [optional] |
| **issue_ids** | **Array&lt;Integer&gt;** | Ids of the issues you want to search worklogs for | [optional] |
| **project_ids** | **Array&lt;Integer&gt;** | Ids of the projects you want to search worklogs for | [optional] |
| **to** | **String** | Retrieve worklogs that ends up to and including this date. | [optional] |
| **updated_from** | **String** | Retrieve worklogs that have been updated from this date | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::WorklogSearchInput.new(
  author_ids: [&quot;123456:01234567-89ab-cdef-0123-456789abcdef&quot;,&quot;123456:01234567-89ab-cdef-0123-456789abcdef&quot;],
  from: 2022-05-17,
  issue_ids: [&quot;10000&quot;,&quot;100001&quot;],
  project_ids: [&quot;1&quot;,&quot;2&quot;],
  to: 2022-05-17,
  updated_from: 2022-05-17
)
```

