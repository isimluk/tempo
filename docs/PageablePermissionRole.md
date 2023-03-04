# OpenapiClient::PageablePermissionRole

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**PageableMetadata**](PageableMetadata.md) |  |  |
| **results** | [**Array&lt;PermissionRole&gt;**](PermissionRole.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PageablePermissionRole.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

