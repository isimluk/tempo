# OpenapiClient::AccountsApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_account**](AccountsApi.md#create_account) | **POST** /accounts | Create new Account |
| [**delete_account**](AccountsApi.md#delete_account) | **DELETE** /accounts/{key} | Delete Account |
| [**get_account_by_id**](AccountsApi.md#get_account_by_id) | **GET** /accounts/{id} | Retrieve Account |
| [**get_account_links**](AccountsApi.md#get_account_links) | **GET** /accounts/{key}/links | Retrieve Account links |
| [**get_accounts**](AccountsApi.md#get_accounts) | **GET** /accounts | Retrieve Accounts |
| [**search_accounts**](AccountsApi.md#search_accounts) | **POST** /accounts/search | Search Accounts |
| [**update_account**](AccountsApi.md#update_account) | **PUT** /accounts/{key} | Update Account |


## create_account

> <Account> create_account(opts)

Create new Account

Creates a new Account using the provided input and returns the newly created Account

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountsApi.new
opts = {
  account_input: OpenapiClient::AccountInput.new({key: 'CLOUDBAY_DEVELOPMENT', lead_account_id: '123456:01234567-89ab-cdef-0123-456789abcdef', name: 'Cloudbay: Development', status: 'CLOSED'}) # AccountInput | 
}

begin
  # Create new Account
  result = api_instance.create_account(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->create_account: #{e}"
end
```

#### Using the create_account_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Account>, Integer, Hash)> create_account_with_http_info(opts)

```ruby
begin
  # Create new Account
  data, status_code, headers = api_instance.create_account_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Account>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->create_account_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_input** | [**AccountInput**](AccountInput.md) |  | [optional] |

### Return type

[**Account**](Account.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_account

> delete_account(key)

Delete Account

Deletes an existing Account for the given key

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountsApi.new
key = 'key_example' # String | A set of character that uniquely identify the Account

begin
  # Delete Account
  api_instance.delete_account(key)
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->delete_account: #{e}"
end
```

#### Using the delete_account_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_account_with_http_info(key)

```ruby
begin
  # Delete Account
  data, status_code, headers = api_instance.delete_account_with_http_info(key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->delete_account_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** | A set of character that uniquely identify the Account |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_account_by_id

> <Account> get_account_by_id(id)

Retrieve Account

Retrieves an existing Account for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountsApi.new
id = 56 # Integer | An integer uniquely identifies the Account

begin
  # Retrieve Account
  result = api_instance.get_account_by_id(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->get_account_by_id: #{e}"
end
```

#### Using the get_account_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Account>, Integer, Hash)> get_account_by_id_with_http_info(id)

```ruby
begin
  # Retrieve Account
  data, status_code, headers = api_instance.get_account_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Account>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->get_account_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An integer uniquely identifies the Account |  |

### Return type

[**Account**](Account.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_account_links

> <PageableAccountLink> get_account_links(key, opts)

Retrieve Account links

Retrieves a list of all existing links associated to the provided Account

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountsApi.new
key = 'key_example' # String | A set of character that uniquely identify the Account
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve Account links
  result = api_instance.get_account_links(key, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->get_account_links: #{e}"
end
```

#### Using the get_account_links_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableAccountLink>, Integer, Hash)> get_account_links_with_http_info(key, opts)

```ruby
begin
  # Retrieve Account links
  data, status_code, headers = api_instance.get_account_links_with_http_info(key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableAccountLink>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->get_account_links_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** | A set of character that uniquely identify the Account |  |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableAccountLink**](PageableAccountLink.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_accounts

> <PageableAccount> get_accounts(opts)

Retrieve Accounts

Retrieves a list of all Accounts

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountsApi.new
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve Accounts
  result = api_instance.get_accounts(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->get_accounts: #{e}"
end
```

#### Using the get_accounts_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableAccount>, Integer, Hash)> get_accounts_with_http_info(opts)

```ruby
begin
  # Retrieve Accounts
  data, status_code, headers = api_instance.get_accounts_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableAccount>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->get_accounts_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableAccount**](PageableAccount.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_accounts

> <PageableAccount> search_accounts(opts)

Search Accounts

Retrieves a list of existing Accounts that matches the given search parameters

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountsApi.new
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56, # Integer | Limit the number of elements on the response
  account_search_input: OpenapiClient::AccountSearchInput.new # AccountSearchInput | 
}

begin
  # Search Accounts
  result = api_instance.search_accounts(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->search_accounts: #{e}"
end
```

#### Using the search_accounts_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableAccount>, Integer, Hash)> search_accounts_with_http_info(opts)

```ruby
begin
  # Search Accounts
  data, status_code, headers = api_instance.search_accounts_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableAccount>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->search_accounts_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |
| **account_search_input** | [**AccountSearchInput**](AccountSearchInput.md) |  | [optional] |

### Return type

[**PageableAccount**](PageableAccount.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_account

> <Account> update_account(key, opts)

Update Account

Updates an existing Account for the given key using the provided input and returns the updated Account

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AccountsApi.new
key = 'key_example' # String | A set of character that uniquely identify the account to be updated
opts = {
  account_input: OpenapiClient::AccountInput.new({key: 'CLOUDBAY_DEVELOPMENT', lead_account_id: '123456:01234567-89ab-cdef-0123-456789abcdef', name: 'Cloudbay: Development', status: 'CLOSED'}) # AccountInput | 
}

begin
  # Update Account
  result = api_instance.update_account(key, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->update_account: #{e}"
end
```

#### Using the update_account_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Account>, Integer, Hash)> update_account_with_http_info(key, opts)

```ruby
begin
  # Update Account
  data, status_code, headers = api_instance.update_account_with_http_info(key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Account>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AccountsApi->update_account_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** | A set of character that uniquely identify the account to be updated |  |
| **account_input** | [**AccountInput**](AccountInput.md) |  | [optional] |

### Return type

[**Account**](Account.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

