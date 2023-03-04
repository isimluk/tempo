# OpenapiClient::PlannedTimeValuesPlanPeriod

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Integer** | The number of results returned. | [optional] |
| **values** | [**Array&lt;PlanPeriod&gt;**](PlanPeriod.md) | List of days/periods that are included in this plan within the scope of the given date range. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PlannedTimeValuesPlanPeriod.new(
  count: 1,
  values: null
)
```

