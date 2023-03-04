# OpenapiClient::PageableTeam

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**PageableMetadata**](PageableMetadata.md) |  |  |
| **results** | [**Array&lt;Team&gt;**](Team.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PageableTeam.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

