# OpenapiClient::TeamMembershipResults

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**ResultsMetadata**](ResultsMetadata.md) |  |  |
| **results** | [**Array&lt;TeamMembership&gt;**](TeamMembership.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TeamMembershipResults.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

