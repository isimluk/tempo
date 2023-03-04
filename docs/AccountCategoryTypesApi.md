# OpenapiClient::AccountCategoryTypesApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_types**](AccountCategoryTypesApi.md#get_types) | **GET** /account-category-types | Retrieve Category Types |


## get_types

> <CategoryTypeResults> get_types

Retrieve Category Types

Retrieves a list of all Category Types

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountCategoryTypesApi.new

begin
  # Retrieve Category Types
  result = api_instance.get_types
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountCategoryTypesApi->get_types: #{e}"
end
```

#### Using the get_types_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CategoryTypeResults>, Integer, Hash)> get_types_with_http_info

```ruby
begin
  # Retrieve Category Types
  data, status_code, headers = api_instance.get_types_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CategoryTypeResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountCategoryTypesApi->get_types_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**CategoryTypeResults**](CategoryTypeResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

