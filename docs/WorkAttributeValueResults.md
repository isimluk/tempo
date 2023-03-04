# OpenapiClient::WorkAttributeValueResults

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**ResultsMetadata**](ResultsMetadata.md) |  |  |
| **results** | [**Array&lt;WorkAttributeValue&gt;**](WorkAttributeValue.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::WorkAttributeValueResults.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

