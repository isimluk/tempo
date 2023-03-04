# OpenapiClient::HolidayScheme

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **default_scheme** | **Boolean** | Boolean to define if this is the default scheme |  |
| **description** | **String** | The description of the &#x60;Holiday Scheme&#x60; | [optional] |
| **id** | **Integer** | The id of the &#x60;Holiday Scheme&#x60; |  |
| **member_count** | **Integer** | The amount of people working under this &#x60;Holiday Scheme&#x60; |  |
| **name** | **String** | The name of the &#x60;Holiday Scheme&#x60; |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::HolidayScheme.new(
  default_scheme: true,
  description: Default holiday scheme for all employees,
  id: 1,
  member_count: 67,
  name: Default Holiday Scheme,
  _self: https://api.tempo.io/[...]
)
```

