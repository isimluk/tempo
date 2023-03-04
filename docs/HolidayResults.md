# OpenapiClient::HolidayResults

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**ResultsMetadata**](ResultsMetadata.md) |  |  |
| **results** | [**Array&lt;Holiday&gt;**](Holiday.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::HolidayResults.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

