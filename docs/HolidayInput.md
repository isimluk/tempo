# OpenapiClient::HolidayInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** | The date of the &#x60;Holiday&#x60; |  |
| **description** | **String** | The description of the &#x60;Holiday&#x60; | [optional] |
| **duration_seconds** | **Integer** | The duration in seconds of the &#x60;Holiday&#x60; |  |
| **name** | **String** | The name of the &#x60;Holiday&#x60; |  |
| **type** | **String** | The type of the &#x60;Holiday&#x60; |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::HolidayInput.new(
  date: null,
  description: Holiday to celebrate all good things,
  duration_seconds: 18000,
  name: National Holiday,
  type: FIXED
)
```

