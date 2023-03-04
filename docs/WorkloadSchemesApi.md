# OpenapiClient::WorkloadSchemesApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_workload_scheme**](WorkloadSchemesApi.md#create_workload_scheme) | **POST** /workload-schemes | Create Workload Scheme |
| [**delete_workload_scheme**](WorkloadSchemesApi.md#delete_workload_scheme) | **DELETE** /workload-schemes/{id} | Delete Workload Scheme |
| [**get_user_workload_scheme**](WorkloadSchemesApi.md#get_user_workload_scheme) | **GET** /workload-schemes/users/{accountId} | Retrieve Workload Scheme for User |
| [**get_workload_scheme_by_id**](WorkloadSchemesApi.md#get_workload_scheme_by_id) | **GET** /workload-schemes/{id} | Retrieve Workload Scheme |
| [**get_workload_scheme_members1**](WorkloadSchemesApi.md#get_workload_scheme_members1) | **GET** /workload-schemes/{id}/members | Retrieve Members of Workload Scheme |
| [**get_workload_schemes**](WorkloadSchemesApi.md#get_workload_schemes) | **GET** /workload-schemes | Retrieve Workload Schemes |
| [**set_default_workload_scheme**](WorkloadSchemesApi.md#set_default_workload_scheme) | **PUT** /workload-schemes/{id}/default | Set default Workload Scheme |
| [**set_workload_scheme_for_users**](WorkloadSchemesApi.md#set_workload_scheme_for_users) | **POST** /workload-schemes/{id}/members | Add Users to Workload Scheme |
| [**update_workload_scheme**](WorkloadSchemesApi.md#update_workload_scheme) | **PUT** /workload-schemes/{id} | Update Workload Scheme |


## create_workload_scheme

> <WorkloadScheme> create_workload_scheme(opts)

Create Workload Scheme

Creates a new Workload Scheme using the provided input and returns the newly created Workload Scheme

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkloadSchemesApi.new
opts = {
  workload_scheme_input: OpenapiClient::WorkloadSchemeInput.new({name: 'Part-time Workload Scheme'}) # WorkloadSchemeInput | 
}

begin
  # Create Workload Scheme
  result = api_instance.create_workload_scheme(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->create_workload_scheme: #{e}"
end
```

#### Using the create_workload_scheme_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WorkloadScheme>, Integer, Hash)> create_workload_scheme_with_http_info(opts)

```ruby
begin
  # Create Workload Scheme
  data, status_code, headers = api_instance.create_workload_scheme_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WorkloadScheme>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->create_workload_scheme_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **workload_scheme_input** | [**WorkloadSchemeInput**](WorkloadSchemeInput.md) |  | [optional] |

### Return type

[**WorkloadScheme**](WorkloadScheme.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_workload_scheme

> delete_workload_scheme(id)

Delete Workload Scheme

Deletes a Workload Scheme for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkloadSchemesApi.new
id = 'id_example' # String | ID of the workload scheme

begin
  # Delete Workload Scheme
  api_instance.delete_workload_scheme(id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->delete_workload_scheme: #{e}"
end
```

#### Using the delete_workload_scheme_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_workload_scheme_with_http_info(id)

```ruby
begin
  # Delete Workload Scheme
  data, status_code, headers = api_instance.delete_workload_scheme_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->delete_workload_scheme_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | ID of the workload scheme |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_user_workload_scheme

> <WorkloadScheme> get_user_workload_scheme(account_id)

Retrieve Workload Scheme for User

Retrieves an existing Workload Scheme for the given User

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkloadSchemesApi.new
account_id = 'account_id_example' # String | A unique identifier of the user in Jira

begin
  # Retrieve Workload Scheme for User
  result = api_instance.get_user_workload_scheme(account_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->get_user_workload_scheme: #{e}"
end
```

#### Using the get_user_workload_scheme_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WorkloadScheme>, Integer, Hash)> get_user_workload_scheme_with_http_info(account_id)

```ruby
begin
  # Retrieve Workload Scheme for User
  data, status_code, headers = api_instance.get_user_workload_scheme_with_http_info(account_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WorkloadScheme>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->get_user_workload_scheme_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | A unique identifier of the user in Jira |  |

### Return type

[**WorkloadScheme**](WorkloadScheme.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_workload_scheme_by_id

> <WorkloadScheme> get_workload_scheme_by_id(id)

Retrieve Workload Scheme

Retrieves an existing Workload Scheme for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkloadSchemesApi.new
id = 'id_example' # String | ID of the workload scheme

begin
  # Retrieve Workload Scheme
  result = api_instance.get_workload_scheme_by_id(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->get_workload_scheme_by_id: #{e}"
end
```

#### Using the get_workload_scheme_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WorkloadScheme>, Integer, Hash)> get_workload_scheme_by_id_with_http_info(id)

```ruby
begin
  # Retrieve Workload Scheme
  data, status_code, headers = api_instance.get_workload_scheme_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WorkloadScheme>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->get_workload_scheme_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | ID of the workload scheme |  |

### Return type

[**WorkloadScheme**](WorkloadScheme.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_workload_scheme_members1

> <PageableUser> get_workload_scheme_members1(id, opts)

Retrieve Members of Workload Scheme

Retrieves a list of all the Members for the given Workload Scheme

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkloadSchemesApi.new
id = 'id_example' # String | ID of the workload scheme
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve Members of Workload Scheme
  result = api_instance.get_workload_scheme_members1(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->get_workload_scheme_members1: #{e}"
end
```

#### Using the get_workload_scheme_members1_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableUser>, Integer, Hash)> get_workload_scheme_members1_with_http_info(id, opts)

```ruby
begin
  # Retrieve Members of Workload Scheme
  data, status_code, headers = api_instance.get_workload_scheme_members1_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableUser>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->get_workload_scheme_members1_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | ID of the workload scheme |  |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableUser**](PageableUser.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_workload_schemes

> <PageableWorkloadScheme> get_workload_schemes(opts)

Retrieve Workload Schemes

Retrieves a list of all Workload Schemes

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkloadSchemesApi.new
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve Workload Schemes
  result = api_instance.get_workload_schemes(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->get_workload_schemes: #{e}"
end
```

#### Using the get_workload_schemes_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableWorkloadScheme>, Integer, Hash)> get_workload_schemes_with_http_info(opts)

```ruby
begin
  # Retrieve Workload Schemes
  data, status_code, headers = api_instance.get_workload_schemes_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableWorkloadScheme>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->get_workload_schemes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableWorkloadScheme**](PageableWorkloadScheme.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## set_default_workload_scheme

> <WorkloadScheme> set_default_workload_scheme(id)

Set default Workload Scheme

Sets the given Workload Scheme as default

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkloadSchemesApi.new
id = 'id_example' # String | ID of the workload scheme

begin
  # Set default Workload Scheme
  result = api_instance.set_default_workload_scheme(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->set_default_workload_scheme: #{e}"
end
```

#### Using the set_default_workload_scheme_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WorkloadScheme>, Integer, Hash)> set_default_workload_scheme_with_http_info(id)

```ruby
begin
  # Set default Workload Scheme
  data, status_code, headers = api_instance.set_default_workload_scheme_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WorkloadScheme>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->set_default_workload_scheme_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | ID of the workload scheme |  |

### Return type

[**WorkloadScheme**](WorkloadScheme.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## set_workload_scheme_for_users

> set_workload_scheme_for_users(id, opts)

Add Users to Workload Scheme

Adds a list of Users to the given Workload Scheme using the provided input

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkloadSchemesApi.new
id = 'id_example' # String | ID of the workload scheme
opts = {
  workload_scheme_members_input: OpenapiClient::WorkloadSchemeMembersInput.new({account_ids: ['111aaaa2222bbbb3333cccc',  '555dddd2222bbbb5656cccc']}) # WorkloadSchemeMembersInput | 
}

begin
  # Add Users to Workload Scheme
  api_instance.set_workload_scheme_for_users(id, opts)
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->set_workload_scheme_for_users: #{e}"
end
```

#### Using the set_workload_scheme_for_users_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> set_workload_scheme_for_users_with_http_info(id, opts)

```ruby
begin
  # Add Users to Workload Scheme
  data, status_code, headers = api_instance.set_workload_scheme_for_users_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->set_workload_scheme_for_users_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | ID of the workload scheme |  |
| **workload_scheme_members_input** | [**WorkloadSchemeMembersInput**](WorkloadSchemeMembersInput.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## update_workload_scheme

> <WorkloadScheme> update_workload_scheme(id, opts)

Update Workload Scheme

Updates an existing Workload Scheme for the given id using the provided input and returns the updated Workload Scheme

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkloadSchemesApi.new
id = 'id_example' # String | ID of the workload scheme
opts = {
  workload_scheme_input: OpenapiClient::WorkloadSchemeInput.new({name: 'Part-time Workload Scheme'}) # WorkloadSchemeInput | 
}

begin
  # Update Workload Scheme
  result = api_instance.update_workload_scheme(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->update_workload_scheme: #{e}"
end
```

#### Using the update_workload_scheme_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WorkloadScheme>, Integer, Hash)> update_workload_scheme_with_http_info(id, opts)

```ruby
begin
  # Update Workload Scheme
  data, status_code, headers = api_instance.update_workload_scheme_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WorkloadScheme>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkloadSchemesApi->update_workload_scheme_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | ID of the workload scheme |  |
| **workload_scheme_input** | [**WorkloadSchemeInput**](WorkloadSchemeInput.md) |  | [optional] |

### Return type

[**WorkloadScheme**](WorkloadScheme.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

