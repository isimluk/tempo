# OpenapiClient::RolesApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_role**](RolesApi.md#create_role) | **POST** /roles | Create new Role |
| [**delete_role**](RolesApi.md#delete_role) | **DELETE** /roles/{id} | Delete Role |
| [**get_all_roles**](RolesApi.md#get_all_roles) | **GET** /roles | Retrieve Roles |
| [**get_default_role**](RolesApi.md#get_default_role) | **GET** /roles/default | Retrieve default Role |
| [**get_role_by_id**](RolesApi.md#get_role_by_id) | **GET** /roles/{id} | Retrieve Role by id |
| [**update_role**](RolesApi.md#update_role) | **PUT** /roles/{id} | Update Role |


## create_role

> <Role> create_role(opts)

Create new Role

Creates a new Role and returns the newly created Role

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::RolesApi.new
opts = {
  role_input: OpenapiClient::RoleInput.new({name: 'Developer'}) # RoleInput | 
}

begin
  # Create new Role
  result = api_instance.create_role(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling RolesApi->create_role: #{e}"
end
```

#### Using the create_role_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Role>, Integer, Hash)> create_role_with_http_info(opts)

```ruby
begin
  # Create new Role
  data, status_code, headers = api_instance.create_role_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Role>
rescue OpenapiClient::ApiError => e
  puts "Error when calling RolesApi->create_role_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **role_input** | [**RoleInput**](RoleInput.md) |  | [optional] |

### Return type

[**Role**](Role.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_role

> delete_role(id)

Delete Role

Deletes an existing Role for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::RolesApi.new
id = 'id_example' # String | An id that uniquely identifies the Role

begin
  # Delete Role
  api_instance.delete_role(id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling RolesApi->delete_role: #{e}"
end
```

#### Using the delete_role_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_role_with_http_info(id)

```ruby
begin
  # Delete Role
  data, status_code, headers = api_instance.delete_role_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling RolesApi->delete_role_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | An id that uniquely identifies the Role |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_all_roles

> <RoleResults> get_all_roles

Retrieve Roles

Retrieves a list of all Roles

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::RolesApi.new

begin
  # Retrieve Roles
  result = api_instance.get_all_roles
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling RolesApi->get_all_roles: #{e}"
end
```

#### Using the get_all_roles_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RoleResults>, Integer, Hash)> get_all_roles_with_http_info

```ruby
begin
  # Retrieve Roles
  data, status_code, headers = api_instance.get_all_roles_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RoleResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling RolesApi->get_all_roles_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**RoleResults**](RoleResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_default_role

> <Role> get_default_role

Retrieve default Role

Retrieves the default Role

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::RolesApi.new

begin
  # Retrieve default Role
  result = api_instance.get_default_role
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling RolesApi->get_default_role: #{e}"
end
```

#### Using the get_default_role_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Role>, Integer, Hash)> get_default_role_with_http_info

```ruby
begin
  # Retrieve default Role
  data, status_code, headers = api_instance.get_default_role_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Role>
rescue OpenapiClient::ApiError => e
  puts "Error when calling RolesApi->get_default_role_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Role**](Role.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_role_by_id

> <Role> get_role_by_id(id)

Retrieve Role by id

Retrieves an existing Role for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::RolesApi.new
id = 'id_example' # String | An id that uniquely identifies the Role

begin
  # Retrieve Role by id
  result = api_instance.get_role_by_id(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling RolesApi->get_role_by_id: #{e}"
end
```

#### Using the get_role_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Role>, Integer, Hash)> get_role_by_id_with_http_info(id)

```ruby
begin
  # Retrieve Role by id
  data, status_code, headers = api_instance.get_role_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Role>
rescue OpenapiClient::ApiError => e
  puts "Error when calling RolesApi->get_role_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | An id that uniquely identifies the Role |  |

### Return type

[**Role**](Role.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_role

> <Role> update_role(id, opts)

Update Role

Updates an existing Role for the given id with the given parameters

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::RolesApi.new
id = 'id_example' # String | An id that uniquely identifies the Role
opts = {
  role_input: OpenapiClient::RoleInput.new({name: 'Developer'}) # RoleInput | 
}

begin
  # Update Role
  result = api_instance.update_role(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling RolesApi->update_role: #{e}"
end
```

#### Using the update_role_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Role>, Integer, Hash)> update_role_with_http_info(id, opts)

```ruby
begin
  # Update Role
  data, status_code, headers = api_instance.update_role_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Role>
rescue OpenapiClient::ApiError => e
  puts "Error when calling RolesApi->update_role_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | An id that uniquely identifies the Role |  |
| **role_input** | [**RoleInput**](RoleInput.md) |  | [optional] |

### Return type

[**Role**](Role.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

