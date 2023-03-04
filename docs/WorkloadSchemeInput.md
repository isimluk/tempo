# OpenapiClient::WorkloadSchemeInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **days** | [**Array&lt;WorkloadSchemeDayInput&gt;**](WorkloadSchemeDayInput.md) | The list of days and their required hours in the workload scheme. This list must be unique and contains all weekdays [Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday] | [optional] |
| **description** | **String** | The description of the workload scheme | [optional] |
| **name** | **String** | The name of the workload scheme |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::WorkloadSchemeInput.new(
  days: null,
  description: Employees working 50%,
  name: Part-time Workload Scheme
)
```

