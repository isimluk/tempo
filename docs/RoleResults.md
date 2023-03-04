# OpenapiClient::RoleResults

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**ResultsMetadata**](ResultsMetadata.md) |  |  |
| **results** | [**Array&lt;Role&gt;**](Role.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::RoleResults.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

