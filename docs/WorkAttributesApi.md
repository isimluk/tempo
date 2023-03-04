# OpenapiClient::WorkAttributesApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_work_attributes**](WorkAttributesApi.md#create_work_attributes) | **POST** /work-attributes | Create Work Attribute |
| [**delete_work_attribute_by_key**](WorkAttributesApi.md#delete_work_attribute_by_key) | **DELETE** /work-attributes/{key} | Delete Work Attribute |
| [**get_work_attribute_by_key**](WorkAttributesApi.md#get_work_attribute_by_key) | **GET** /work-attributes/{key} | Retrieve Work Attribute |
| [**get_work_attributes**](WorkAttributesApi.md#get_work_attributes) | **GET** /work-attributes | Retrieve Work Attributes |
| [**update_work_attribute_by_key**](WorkAttributesApi.md#update_work_attribute_by_key) | **PUT** /work-attributes/{key} | Update Work Attribute |


## create_work_attributes

> <WorkAttribute> create_work_attributes(opts)

Create Work Attribute

Creates a new Work Attribute using the provided input and returns the newly created Work Attribute

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkAttributesApi.new
opts = {
  create_work_attribute_input: OpenapiClient::CreateWorkAttributeInput.new({key: '_Attr_1_', name: 'Attr 1', type: 'ACCOUNT'}) # CreateWorkAttributeInput | 
}

begin
  # Create Work Attribute
  result = api_instance.create_work_attributes(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkAttributesApi->create_work_attributes: #{e}"
end
```

#### Using the create_work_attributes_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WorkAttribute>, Integer, Hash)> create_work_attributes_with_http_info(opts)

```ruby
begin
  # Create Work Attribute
  data, status_code, headers = api_instance.create_work_attributes_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WorkAttribute>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkAttributesApi->create_work_attributes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_work_attribute_input** | [**CreateWorkAttributeInput**](CreateWorkAttributeInput.md) |  | [optional] |

### Return type

[**WorkAttribute**](WorkAttribute.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_work_attribute_by_key

> delete_work_attribute_by_key(key)

Delete Work Attribute

Deletes an existing Work Attribute for the given key

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkAttributesApi.new
key = 'key_example' # String | 

begin
  # Delete Work Attribute
  api_instance.delete_work_attribute_by_key(key)
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkAttributesApi->delete_work_attribute_by_key: #{e}"
end
```

#### Using the delete_work_attribute_by_key_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_work_attribute_by_key_with_http_info(key)

```ruby
begin
  # Delete Work Attribute
  data, status_code, headers = api_instance.delete_work_attribute_by_key_with_http_info(key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkAttributesApi->delete_work_attribute_by_key_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_work_attribute_by_key

> <WorkAttribute> get_work_attribute_by_key(key)

Retrieve Work Attribute

Retrieves an existing Work Attribute for the given key

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkAttributesApi.new
key = 'key_example' # String | 

begin
  # Retrieve Work Attribute
  result = api_instance.get_work_attribute_by_key(key)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkAttributesApi->get_work_attribute_by_key: #{e}"
end
```

#### Using the get_work_attribute_by_key_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WorkAttribute>, Integer, Hash)> get_work_attribute_by_key_with_http_info(key)

```ruby
begin
  # Retrieve Work Attribute
  data, status_code, headers = api_instance.get_work_attribute_by_key_with_http_info(key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WorkAttribute>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkAttributesApi->get_work_attribute_by_key_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** |  |  |

### Return type

[**WorkAttribute**](WorkAttribute.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_work_attributes

> <PageableWorkAttribute> get_work_attributes(opts)

Retrieve Work Attributes

Retrieves a list of all Work Attributes

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkAttributesApi.new
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve Work Attributes
  result = api_instance.get_work_attributes(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkAttributesApi->get_work_attributes: #{e}"
end
```

#### Using the get_work_attributes_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableWorkAttribute>, Integer, Hash)> get_work_attributes_with_http_info(opts)

```ruby
begin
  # Retrieve Work Attributes
  data, status_code, headers = api_instance.get_work_attributes_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableWorkAttribute>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkAttributesApi->get_work_attributes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableWorkAttribute**](PageableWorkAttribute.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_work_attribute_by_key

> <WorkAttribute> update_work_attribute_by_key(key, opts)

Update Work Attribute

Updates an existing Work Attribute for the given key using the provided input and returns the updated Work Attribute

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorkAttributesApi.new
key = 'key_example' # String | 
opts = {
  update_work_attribute_input: OpenapiClient::UpdateWorkAttributeInput.new({name: 'Attr 1', type: 'ACCOUNT'}) # UpdateWorkAttributeInput | 
}

begin
  # Update Work Attribute
  result = api_instance.update_work_attribute_by_key(key, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkAttributesApi->update_work_attribute_by_key: #{e}"
end
```

#### Using the update_work_attribute_by_key_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WorkAttribute>, Integer, Hash)> update_work_attribute_by_key_with_http_info(key, opts)

```ruby
begin
  # Update Work Attribute
  data, status_code, headers = api_instance.update_work_attribute_by_key_with_http_info(key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WorkAttribute>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorkAttributesApi->update_work_attribute_by_key_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** |  |  |
| **update_work_attribute_input** | [**UpdateWorkAttributeInput**](UpdateWorkAttributeInput.md) |  | [optional] |

### Return type

[**WorkAttribute**](WorkAttribute.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

