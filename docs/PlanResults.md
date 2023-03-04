# OpenapiClient::PlanResults

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**ResultsMetadata**](ResultsMetadata.md) |  |  |
| **results** | [**Array&lt;Plan&gt;**](Plan.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PlanResults.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

