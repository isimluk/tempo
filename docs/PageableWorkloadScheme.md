# OpenapiClient::PageableWorkloadScheme

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**PageableMetadata**](PageableMetadata.md) |  |  |
| **results** | [**Array&lt;WorkloadScheme&gt;**](WorkloadScheme.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PageableWorkloadScheme.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

