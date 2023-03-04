# OpenapiClient::WorkloadScheme

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **days** | [**Array&lt;WorkloadSchemeDay&gt;**](WorkloadSchemeDay.md) | The list of days and their required hours in this &#x60;WorkloadScheme&#x60; |  |
| **default_scheme** | **Boolean** | If this is the default &#x60;WorkloadScheme&#x60; |  |
| **description** | **String** | The description &#x60;WorkloadScheme&#x60; |  |
| **id** | **Integer** | The id of the &#x60;WorkloadScheme&#x60; |  |
| **member_count** | **Integer** | The number of members in this &#x60;WorkloadScheme&#x60; |  |
| **name** | **String** | The name of the &#x60;WorkloadScheme&#x60; |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::WorkloadScheme.new(
  days: null,
  default_scheme: false,
  description: Employees working 50%,
  id: 1,
  member_count: 100,
  name: Part-time Workload Scheme,
  _self: https://api.tempo.io/[...]
)
```

