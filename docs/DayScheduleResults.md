# OpenapiClient::DayScheduleResults

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metadata** | [**ResultsMetadata**](ResultsMetadata.md) |  |  |
| **results** | [**Array&lt;DaySchedule&gt;**](DaySchedule.md) |  |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::DayScheduleResults.new(
  metadata: null,
  results: null,
  _self: https://api.tempo.io/[...]
)
```

