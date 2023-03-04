# OpenapiClient::PageableSkill

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**PageableMetadata**](PageableMetadata.md) |  |  |
| **results** | [**Array&lt;Skill&gt;**](Skill.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PageableSkill.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

