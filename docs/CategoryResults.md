# OpenapiClient::CategoryResults

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**ResultsMetadata**](ResultsMetadata.md) |  |  |
| **results** | [**Array&lt;Category&gt;**](Category.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::CategoryResults.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

