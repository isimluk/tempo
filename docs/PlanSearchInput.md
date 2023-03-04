# OpenapiClient::PlanSearchInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_ids** | **Array&lt;String&gt;** | Ids of the user assignees you want to search plans for. | [optional] |
| **assignee_types** | **Array&lt;String&gt;** | Types of the assignees you want to search plans for. | [optional] |
| **from** | **String** | Retrieve plans starting with this date. |  |
| **generic_resource_ids** | **Array&lt;Integer&gt;** | Ids of the generic resources you want to search plans for. | [optional] |
| **limit** | **Integer** | Maximum number of results on each page. | [optional] |
| **offset** | **Integer** | Number of skipped results. | [optional] |
| **plan_ids** | **Array&lt;Integer&gt;** | Ids of the plans you want to search for. | [optional] |
| **plan_item_ids** | **Array&lt;Integer&gt;** | Ids of the items you want to search plans for. | [optional] |
| **plan_item_types** | **Array&lt;String&gt;** | Types of the items you want to search plans for. | [optional] |
| **planned_time_breakdown** | **Array&lt;String&gt;** | Defines how detailed you would like to see the breakdown of the planned time for each &#x60;Plan&#x60;. | [optional] |
| **to** | **String** | Retrieve plans that ends up to and including this date. |  |
| **updated_from** | **String** | Retrieve plans that have been updated from this date. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PlanSearchInput.new(
  account_ids: [&quot;123456:01234567-89ab-cdef-0123-456789abcdef&quot;,&quot;123456:01234567-89ab-cdef-0123-456789abcdef&quot;],
  assignee_types: [&quot;USER&quot;,&quot;GENERIC&quot;],
  from: 2022-05-17,
  generic_resource_ids: [&quot;1&quot;,&quot;2&quot;],
  limit: 50,
  offset: 0,
  plan_ids: [&quot;1&quot;,&quot;2&quot;],
  plan_item_ids: [&quot;10000&quot;,&quot;10001&quot;],
  plan_item_types: [&quot;ISSUE&quot;,&quot;PROJECT&quot;],
  planned_time_breakdown: [&quot;DAILY&quot;,&quot;PERIOD&quot;],
  to: 2022-05-17,
  updated_from: 2022-05-17
)
```

