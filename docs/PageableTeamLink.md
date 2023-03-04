# OpenapiClient::PageableTeamLink

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**PageableMetadata**](PageableMetadata.md) |  |  |
| **results** | [**Array&lt;TeamLink&gt;**](TeamLink.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PageableTeamLink.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

