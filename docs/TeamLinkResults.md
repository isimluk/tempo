# OpenapiClient::TeamLinkResults

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**ResultsMetadata**](ResultsMetadata.md) |  |  |
| **results** | [**Array&lt;TeamLink&gt;**](TeamLink.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TeamLinkResults.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

