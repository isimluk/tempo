# OpenapiClient::AccountLinkResults

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**ResultsMetadata**](ResultsMetadata.md) |  |  |
| **results** | [**Array&lt;AccountLink&gt;**](AccountLink.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AccountLinkResults.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

