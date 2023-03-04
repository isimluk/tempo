# OpenapiClient::Pageable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**PageableMetadata**](PageableMetadata.md) |  |  |
| **results** | [**Array&lt;Worklog&gt;**](Worklog.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Pageable.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

