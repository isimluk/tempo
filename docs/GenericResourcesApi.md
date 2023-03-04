# OpenapiClient::GenericResourcesApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_generic_resource**](GenericResourcesApi.md#create_generic_resource) | **POST** /generic-resources | Create Generic Resource |
| [**delete_generic_resource**](GenericResourcesApi.md#delete_generic_resource) | **DELETE** /generic-resources/{id} | Delete Generic Resource |
| [**edit_generic_resource**](GenericResourcesApi.md#edit_generic_resource) | **PUT** /generic-resources/{id} | Update Generic Resource |
| [**get_generic_resource**](GenericResourcesApi.md#get_generic_resource) | **GET** /generic-resources/{id} | Retrieve Generic Resource |
| [**search_generic_resources**](GenericResourcesApi.md#search_generic_resources) | **POST** /generic-resources/search | Search Generic Resources |


## create_generic_resource

> <GenericResource> create_generic_resource(opts)

Create Generic Resource

Creates a new Generic Resource using the provided input and returns the newly created Generic Resource

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::GenericResourcesApi.new
opts = {
  generic_resource_input: OpenapiClient::GenericResourceInput.new({name: 'Backend Developer'}) # GenericResourceInput | 
}

begin
  # Create Generic Resource
  result = api_instance.create_generic_resource(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourcesApi->create_generic_resource: #{e}"
end
```

#### Using the create_generic_resource_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenericResource>, Integer, Hash)> create_generic_resource_with_http_info(opts)

```ruby
begin
  # Create Generic Resource
  data, status_code, headers = api_instance.create_generic_resource_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenericResource>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourcesApi->create_generic_resource_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **generic_resource_input** | [**GenericResourceInput**](GenericResourceInput.md) |  | [optional] |

### Return type

[**GenericResource**](GenericResource.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_generic_resource

> delete_generic_resource(id)

Delete Generic Resource

Deletes an existing Generic Resource for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::GenericResourcesApi.new
id = 56 # Integer | An id that uniquely identifies the Generic Resource

begin
  # Delete Generic Resource
  api_instance.delete_generic_resource(id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourcesApi->delete_generic_resource: #{e}"
end
```

#### Using the delete_generic_resource_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_generic_resource_with_http_info(id)

```ruby
begin
  # Delete Generic Resource
  data, status_code, headers = api_instance.delete_generic_resource_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourcesApi->delete_generic_resource_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An id that uniquely identifies the Generic Resource |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## edit_generic_resource

> <GenericResource> edit_generic_resource(id, opts)

Update Generic Resource

Updates an existing Generic Resource for the given id using the provided input and returns the updated Generic Resource

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::GenericResourcesApi.new
id = 56 # Integer | An id that uniquely identifies the Generic Resource
opts = {
  generic_resource_input: OpenapiClient::GenericResourceInput.new({name: 'Backend Developer'}) # GenericResourceInput | 
}

begin
  # Update Generic Resource
  result = api_instance.edit_generic_resource(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourcesApi->edit_generic_resource: #{e}"
end
```

#### Using the edit_generic_resource_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenericResource>, Integer, Hash)> edit_generic_resource_with_http_info(id, opts)

```ruby
begin
  # Update Generic Resource
  data, status_code, headers = api_instance.edit_generic_resource_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenericResource>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourcesApi->edit_generic_resource_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An id that uniquely identifies the Generic Resource |  |
| **generic_resource_input** | [**GenericResourceInput**](GenericResourceInput.md) |  | [optional] |

### Return type

[**GenericResource**](GenericResource.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_generic_resource

> <GenericResource> get_generic_resource(id)

Retrieve Generic Resource

Retrieves an existing Generic Resource for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::GenericResourcesApi.new
id = 56 # Integer | An id that uniquely identifies the Generic Resource

begin
  # Retrieve Generic Resource
  result = api_instance.get_generic_resource(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourcesApi->get_generic_resource: #{e}"
end
```

#### Using the get_generic_resource_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenericResource>, Integer, Hash)> get_generic_resource_with_http_info(id)

```ruby
begin
  # Retrieve Generic Resource
  data, status_code, headers = api_instance.get_generic_resource_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenericResource>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourcesApi->get_generic_resource_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An id that uniquely identifies the Generic Resource |  |

### Return type

[**GenericResource**](GenericResource.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_generic_resources

> <PageableGenericResourceWithoutSelfLink> search_generic_resources(opts)

Search Generic Resources

Retrieves a list of existing Generic Resources that matches the search parameters

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::GenericResourcesApi.new
opts = {
  generic_resource_search_input: OpenapiClient::GenericResourceSearchInput.new # GenericResourceSearchInput | 
}

begin
  # Search Generic Resources
  result = api_instance.search_generic_resources(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourcesApi->search_generic_resources: #{e}"
end
```

#### Using the search_generic_resources_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableGenericResourceWithoutSelfLink>, Integer, Hash)> search_generic_resources_with_http_info(opts)

```ruby
begin
  # Search Generic Resources
  data, status_code, headers = api_instance.search_generic_resources_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableGenericResourceWithoutSelfLink>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourcesApi->search_generic_resources_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **generic_resource_search_input** | [**GenericResourceSearchInput**](GenericResourceSearchInput.md) |  | [optional] |

### Return type

[**PageableGenericResourceWithoutSelfLink**](PageableGenericResourceWithoutSelfLink.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

