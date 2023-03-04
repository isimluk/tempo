# OpenapiClient::Holiday

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** | The date of the &#x60;Holiday&#x60; |  |
| **description** | **String** | The description of the &#x60;Holiday&#x60; | [optional] |
| **duration_seconds** | **Integer** | The duration in seconds of the &#x60;Holiday&#x60; |  |
| **id** | **Integer** | The id of the &#x60;Holiday&#x60; |  |
| **name** | **String** | The name of the &#x60;Holiday&#x60; |  |
| **scheme_id** | **Integer** | The id of the &#x60;Holiday Scheme&#x60; |  |
| **_self** | **String** | A permanent link to this resource |  |
| **type** | **String** | The type of the &#x60;Holiday&#x60; |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Holiday.new(
  date: null,
  description: Holiday to celebrate all good things,
  duration_seconds: 18000,
  id: 1,
  name: National Holiday,
  scheme_id: 2,
  _self: https://api.tempo.io/[...],
  type: FIXED
)
```

