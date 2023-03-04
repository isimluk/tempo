# OpenapiClient::AccountLinksApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_link**](AccountLinksApi.md#create_link) | **POST** /account-links | Create Account Link |
| [**delete_link**](AccountLinksApi.md#delete_link) | **DELETE** /account-links/{id} | Delete Account Link |
| [**get_link**](AccountLinksApi.md#get_link) | **GET** /account-links/{id} | Retrieve Account Link |
| [**get_links_by_project**](AccountLinksApi.md#get_links_by_project) | **GET** /account-links/project/{id} | Retrieve Account Link by Project |


## create_link

> <AccountLink> create_link(opts)

Create Account Link

Creates a new Account Link using the provided input and returns the newly created Account Link

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountLinksApi.new
opts = {
  account_link_input: OpenapiClient::AccountLinkInput.new({account_key: 'CLOUDBAY_DEVELOPMENT', scope_id: 100100, scope_type: 'PROJECT'}) # AccountLinkInput | 
}

begin
  # Create Account Link
  result = api_instance.create_link(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountLinksApi->create_link: #{e}"
end
```

#### Using the create_link_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AccountLink>, Integer, Hash)> create_link_with_http_info(opts)

```ruby
begin
  # Create Account Link
  data, status_code, headers = api_instance.create_link_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AccountLink>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountLinksApi->create_link_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_link_input** | [**AccountLinkInput**](AccountLinkInput.md) |  | [optional] |

### Return type

[**AccountLink**](AccountLink.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_link

> delete_link(id)

Delete Account Link

Deletes an existing Account Link for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountLinksApi.new
id = 56 # Integer | An integer uniquely identifying the `AccountLink`

begin
  # Delete Account Link
  api_instance.delete_link(id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountLinksApi->delete_link: #{e}"
end
```

#### Using the delete_link_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_link_with_http_info(id)

```ruby
begin
  # Delete Account Link
  data, status_code, headers = api_instance.delete_link_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountLinksApi->delete_link_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An integer uniquely identifying the &#x60;AccountLink&#x60; |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_link

> <AccountLink> get_link(id)

Retrieve Account Link

Retrieves an existing Account Link for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountLinksApi.new
id = 56 # Integer | An integer uniquely identifying the `AccountLink`

begin
  # Retrieve Account Link
  result = api_instance.get_link(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountLinksApi->get_link: #{e}"
end
```

#### Using the get_link_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AccountLink>, Integer, Hash)> get_link_with_http_info(id)

```ruby
begin
  # Retrieve Account Link
  data, status_code, headers = api_instance.get_link_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AccountLink>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountLinksApi->get_link_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An integer uniquely identifying the &#x60;AccountLink&#x60; |  |

### Return type

[**AccountLink**](AccountLink.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_links_by_project

> <AccountLinkResults> get_links_by_project(id)

Retrieve Account Link by Project

Retrieves an existing Account Link for the given Project id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountLinksApi.new
id = 789 # Integer | 

begin
  # Retrieve Account Link by Project
  result = api_instance.get_links_by_project(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountLinksApi->get_links_by_project: #{e}"
end
```

#### Using the get_links_by_project_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AccountLinkResults>, Integer, Hash)> get_links_by_project_with_http_info(id)

```ruby
begin
  # Retrieve Account Link by Project
  data, status_code, headers = api_instance.get_links_by_project_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AccountLinkResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountLinksApi->get_links_by_project_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

[**AccountLinkResults**](AccountLinkResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

