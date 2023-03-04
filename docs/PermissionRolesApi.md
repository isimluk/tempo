# OpenapiClient::PermissionRolesApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_permission_group**](PermissionRolesApi.md#create_permission_group) | **POST** /permission-roles | Create Permission Role |
| [**delete_editable_permission_group**](PermissionRolesApi.md#delete_editable_permission_group) | **DELETE** /permission-roles/{id} | Delete Permission Role |
| [**get_global_permission_roles**](PermissionRolesApi.md#get_global_permission_roles) | **GET** /permission-roles/global | Retrieve Global Permission Roles |
| [**get_permission_role**](PermissionRolesApi.md#get_permission_role) | **GET** /permission-roles/{id} | Retrieve Permission Role |
| [**get_permission_roles**](PermissionRolesApi.md#get_permission_roles) | **GET** /permission-roles | Retrieve Permission Roles |
| [**update_permission_group**](PermissionRolesApi.md#update_permission_group) | **PUT** /permission-roles/{id} | Update Permission Role |


## create_permission_group

> <PermissionRole> create_permission_group(opts)

Create Permission Role

Creates a new editable Permission Role using the provided input and returns the newly created Permission Role

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PermissionRolesApi.new
opts = {
  permission_role_input: OpenapiClient::PermissionRoleInput.new({access_type: 'TEAM', name: 'The Role'}) # PermissionRoleInput | 
}

begin
  # Create Permission Role
  result = api_instance.create_permission_group(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PermissionRolesApi->create_permission_group: #{e}"
end
```

#### Using the create_permission_group_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PermissionRole>, Integer, Hash)> create_permission_group_with_http_info(opts)

```ruby
begin
  # Create Permission Role
  data, status_code, headers = api_instance.create_permission_group_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PermissionRole>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PermissionRolesApi->create_permission_group_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **permission_role_input** | [**PermissionRoleInput**](PermissionRoleInput.md) |  | [optional] |

### Return type

[**PermissionRole**](PermissionRole.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_editable_permission_group

> delete_editable_permission_group(id)

Delete Permission Role

Deletes an editable Permission Role.

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PermissionRolesApi.new
id = 56 # Integer | 

begin
  # Delete Permission Role
  api_instance.delete_editable_permission_group(id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling PermissionRolesApi->delete_editable_permission_group: #{e}"
end
```

#### Using the delete_editable_permission_group_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_editable_permission_group_with_http_info(id)

```ruby
begin
  # Delete Permission Role
  data, status_code, headers = api_instance.delete_editable_permission_group_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling PermissionRolesApi->delete_editable_permission_group_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_global_permission_roles

> <PageablePermissionRole> get_global_permission_roles(opts)

Retrieve Global Permission Roles

Retrieves the Global Permission Roles

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PermissionRolesApi.new
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve Global Permission Roles
  result = api_instance.get_global_permission_roles(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PermissionRolesApi->get_global_permission_roles: #{e}"
end
```

#### Using the get_global_permission_roles_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageablePermissionRole>, Integer, Hash)> get_global_permission_roles_with_http_info(opts)

```ruby
begin
  # Retrieve Global Permission Roles
  data, status_code, headers = api_instance.get_global_permission_roles_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageablePermissionRole>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PermissionRolesApi->get_global_permission_roles_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageablePermissionRole**](PageablePermissionRole.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_permission_role

> <PermissionRole> get_permission_role(id)

Retrieve Permission Role

Retrieves a Permission Role for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PermissionRolesApi.new
id = 'id_example' # String | ID of the permission role

begin
  # Retrieve Permission Role
  result = api_instance.get_permission_role(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PermissionRolesApi->get_permission_role: #{e}"
end
```

#### Using the get_permission_role_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PermissionRole>, Integer, Hash)> get_permission_role_with_http_info(id)

```ruby
begin
  # Retrieve Permission Role
  data, status_code, headers = api_instance.get_permission_role_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PermissionRole>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PermissionRolesApi->get_permission_role_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | ID of the permission role |  |

### Return type

[**PermissionRole**](PermissionRole.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_permission_roles

> <PageablePermissionRole> get_permission_roles(opts)

Retrieve Permission Roles

Retrieves a list of the Permission Roles for a given Team if ID is informed, or retrieves a list of all Permission Roles

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PermissionRolesApi.new
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56, # Integer | Limit the number of elements on the response
  team_id: 'team_id_example' # String | An ID that uniquely identifies the Team for which you want to retrieve Permissions
}

begin
  # Retrieve Permission Roles
  result = api_instance.get_permission_roles(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PermissionRolesApi->get_permission_roles: #{e}"
end
```

#### Using the get_permission_roles_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageablePermissionRole>, Integer, Hash)> get_permission_roles_with_http_info(opts)

```ruby
begin
  # Retrieve Permission Roles
  data, status_code, headers = api_instance.get_permission_roles_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageablePermissionRole>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PermissionRolesApi->get_permission_roles_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |
| **team_id** | **String** | An ID that uniquely identifies the Team for which you want to retrieve Permissions | [optional] |

### Return type

[**PageablePermissionRole**](PageablePermissionRole.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_permission_group

> <PermissionRole> update_permission_group(id, opts)

Update Permission Role

Updates a Permission Role for the given id using the provided input and returns the updated Permission Role. Only editable roles can be updated.

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PermissionRolesApi.new
id = 56 # Integer | 
opts = {
  permission_role_input: OpenapiClient::PermissionRoleInput.new({access_type: 'TEAM', name: 'The Role'}) # PermissionRoleInput | 
}

begin
  # Update Permission Role
  result = api_instance.update_permission_group(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PermissionRolesApi->update_permission_group: #{e}"
end
```

#### Using the update_permission_group_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PermissionRole>, Integer, Hash)> update_permission_group_with_http_info(id, opts)

```ruby
begin
  # Update Permission Role
  data, status_code, headers = api_instance.update_permission_group_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PermissionRole>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PermissionRolesApi->update_permission_group_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **permission_role_input** | [**PermissionRoleInput**](PermissionRoleInput.md) |  | [optional] |

### Return type

[**PermissionRole**](PermissionRole.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

