# OpenapiClient::PermissionRoleInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **access_entity_ids** | **Array&lt;Integer&gt;** | A list of access entity ids | [optional] |
| **access_type** | **String** | The type of the &#x60;PermissionRole&#x60; which can be &#x60;TEAM&#x60; or &#x60;GLOBAL&#x60;. &#x60;GLOBAL&#x60; permission roles don&#39;t have entities. |  |
| **name** | **String** | Name of the permission role |  |
| **permission_keys** | **Array&lt;String&gt;** | A list of permission keys | [optional] |
| **permitted_account_ids** | **Array&lt;String&gt;** | A list of permitted account ids | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PermissionRoleInput.new(
  access_entity_ids: [1],
  access_type: TEAM,
  name: The Role,
  permission_keys: [&quot;permissions.worklog.view&quot;],
  permitted_account_ids: jira-account-id
)
```

