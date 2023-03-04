# OpenapiClient::AccountCategoriesApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_category**](AccountCategoriesApi.md#create_category) | **POST** /account-categories | Create Category |
| [**delete_category**](AccountCategoriesApi.md#delete_category) | **DELETE** /account-categories/{key} | Delete Category |
| [**get_categories**](AccountCategoriesApi.md#get_categories) | **GET** /account-categories | Retrieve Category / Retrieve all Categories |
| [**get_category_by_key**](AccountCategoriesApi.md#get_category_by_key) | **GET** /account-categories/{key} | Retrieve Category |
| [**update_category**](AccountCategoriesApi.md#update_category) | **PUT** /account-categories/{key} | Update Category |


## create_category

> <Category> create_category(opts)

Create Category

Creates a new Category using the provided input and returns the newly created Category

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountCategoriesApi.new
opts = {
  category_input: OpenapiClient::CategoryInput.new({key: 'CLOUDBAY_DEVELOPMENT', name: 'Cloudbay: Development'}) # CategoryInput | 
}

begin
  # Create Category
  result = api_instance.create_category(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountCategoriesApi->create_category: #{e}"
end
```

#### Using the create_category_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Category>, Integer, Hash)> create_category_with_http_info(opts)

```ruby
begin
  # Create Category
  data, status_code, headers = api_instance.create_category_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Category>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountCategoriesApi->create_category_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **category_input** | [**CategoryInput**](CategoryInput.md) |  | [optional] |

### Return type

[**Category**](Category.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_category

> delete_category(key)

Delete Category

Deletes the Category for the given key

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountCategoriesApi.new
key = 'key_example' # String | 

begin
  # Delete Category
  api_instance.delete_category(key)
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountCategoriesApi->delete_category: #{e}"
end
```

#### Using the delete_category_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_category_with_http_info(key)

```ruby
begin
  # Delete Category
  data, status_code, headers = api_instance.delete_category_with_http_info(key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountCategoriesApi->delete_category_with_http_info: #{e}"
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


## get_categories

> <CategoryResults> get_categories(opts)

Retrieve Category / Retrieve all Categories

Retrieves a Category for the given id, or retrieves a list of all Categories if id is not provided. If the Category with the given id is not found, an empty list is returned

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountCategoriesApi.new
opts = {
  id: 56 # Integer | 
}

begin
  # Retrieve Category / Retrieve all Categories
  result = api_instance.get_categories(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountCategoriesApi->get_categories: #{e}"
end
```

#### Using the get_categories_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CategoryResults>, Integer, Hash)> get_categories_with_http_info(opts)

```ruby
begin
  # Retrieve Category / Retrieve all Categories
  data, status_code, headers = api_instance.get_categories_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CategoryResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountCategoriesApi->get_categories_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |

### Return type

[**CategoryResults**](CategoryResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_category_by_key

> <Category> get_category_by_key(key)

Retrieve Category

Retrieves an existing Category for the given key

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountCategoriesApi.new
key = 'key_example' # String | 

begin
  # Retrieve Category
  result = api_instance.get_category_by_key(key)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountCategoriesApi->get_category_by_key: #{e}"
end
```

#### Using the get_category_by_key_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Category>, Integer, Hash)> get_category_by_key_with_http_info(key)

```ruby
begin
  # Retrieve Category
  data, status_code, headers = api_instance.get_category_by_key_with_http_info(key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Category>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountCategoriesApi->get_category_by_key_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** |  |  |

### Return type

[**Category**](Category.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_category

> <Category> update_category(key, opts)

Update Category

Updates the Category for the given key using the provided input and returns the updated Category

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountCategoriesApi.new
key = 'key_example' # String | A set of characters that uniquely identify the category to be updated
opts = {
  category_input: OpenapiClient::CategoryInput.new({key: 'CLOUDBAY_DEVELOPMENT', name: 'Cloudbay: Development'}) # CategoryInput | 
}

begin
  # Update Category
  result = api_instance.update_category(key, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountCategoriesApi->update_category: #{e}"
end
```

#### Using the update_category_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Category>, Integer, Hash)> update_category_with_http_info(key, opts)

```ruby
begin
  # Update Category
  data, status_code, headers = api_instance.update_category_with_http_info(key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Category>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountCategoriesApi->update_category_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** | A set of characters that uniquely identify the category to be updated |  |
| **category_input** | [**CategoryInput**](CategoryInput.md) |  | [optional] |

### Return type

[**Category**](Category.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

