# OpenapiClient::Program

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The id of the &#x60;Program&#x60; |  |
| **manager** | [**User**](User.md) |  | [optional] |
| **name** | **String** | The name of the &#x60;Program&#x60; |  |
| **_self** | **String** | A permanent link to this resource |  |
| **teams** | [**SelfListTeamRef**](SelfListTeamRef.md) |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Program.new(
  id: 100201,
  manager: null,
  name: Program: new Season,
  _self: https://api.tempo.io/[...],
  teams: null
)
```

