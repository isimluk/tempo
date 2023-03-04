# OpenapiClient::PermissionRole

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **access_entities** | [**Array&lt;Entity&gt;**](Entity.md) | List of permission role access entity |  |
| **access_type** | **String** | The type of the permission role which can be &#x60;TEAM&#x60; or &#x60;Global&#x60;. &#x60;GLOBAL&#x60; permission roles don&#39;t have entities. |  |
| **editable** | **Boolean** | Editable roles are manually created with updatable members. |  |
| **id** | **Integer** | The id of the permission role |  |
| **name** | **String** | The name of the permission role |  |
| **permissions** | [**Array&lt;Permission&gt;**](Permission.md) | List of the roles permissions |  |
| **permitted_users** | [**Array&lt;User&gt;**](User.md) | List of users |  |
| **_self** | **String** | A permanent link to this resource |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PermissionRole.new(
  access_entities: null,
  access_type: TEAM,
  editable: false,
  id: 6,
  name: The Role,
  permissions: null,
  permitted_users: null,
  _self: https://api.tempo.io/[...]
)
```

