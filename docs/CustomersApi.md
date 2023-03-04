# OpenapiClient::CustomersApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_customer**](CustomersApi.md#create_customer) | **POST** /customers | Create Customer |
| [**delete_customer**](CustomersApi.md#delete_customer) | **DELETE** /customers/{key} | Delete Customer |
| [**get_customer_accounts**](CustomersApi.md#get_customer_accounts) | **GET** /customers/{id}/accounts | Retrieve Accounts associated with the Customer |
| [**get_customer_by_id**](CustomersApi.md#get_customer_by_id) | **GET** /customers/{id} | Retrieve Customer |
| [**get_customers**](CustomersApi.md#get_customers) | **GET** /customers | Retrieve all Customers |
| [**update_customer**](CustomersApi.md#update_customer) | **PUT** /customers/{key} | Update Customer |


## create_customer

> <Customer> create_customer(opts)

Create Customer

Creates a new Customer using the provided input and returns the newly created Customer

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::CustomersApi.new
opts = {
  customer_input: OpenapiClient::CustomerInput.new({key: 'CLOUDBAY_DEVELOPMENT', name: 'Cloudbay: Development'}) # CustomerInput | 
}

begin
  # Create Customer
  result = api_instance.create_customer(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CustomersApi->create_customer: #{e}"
end
```

#### Using the create_customer_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Customer>, Integer, Hash)> create_customer_with_http_info(opts)

```ruby
begin
  # Create Customer
  data, status_code, headers = api_instance.create_customer_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Customer>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CustomersApi->create_customer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **customer_input** | [**CustomerInput**](CustomerInput.md) |  | [optional] |

### Return type

[**Customer**](Customer.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_customer

> delete_customer(key)

Delete Customer

Deletes the Customer with the given key

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::CustomersApi.new
key = 'key_example' # String | 

begin
  # Delete Customer
  api_instance.delete_customer(key)
rescue OpenapiClient::ApiError => e
  puts "Error when calling CustomersApi->delete_customer: #{e}"
end
```

#### Using the delete_customer_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_customer_with_http_info(key)

```ruby
begin
  # Delete Customer
  data, status_code, headers = api_instance.delete_customer_with_http_info(key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling CustomersApi->delete_customer_with_http_info: #{e}"
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


## get_customer_accounts

> <PageableAccount> get_customer_accounts(id, opts)

Retrieve Accounts associated with the Customer

Retrieves a list of Accounts associated with the given Customer

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::CustomersApi.new
id = 56 # Integer | An integer uniquely identifying the customer
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve Accounts associated with the Customer
  result = api_instance.get_customer_accounts(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CustomersApi->get_customer_accounts: #{e}"
end
```

#### Using the get_customer_accounts_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableAccount>, Integer, Hash)> get_customer_accounts_with_http_info(id, opts)

```ruby
begin
  # Retrieve Accounts associated with the Customer
  data, status_code, headers = api_instance.get_customer_accounts_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableAccount>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CustomersApi->get_customer_accounts_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An integer uniquely identifying the customer |  |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableAccount**](PageableAccount.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_customer_by_id

> <Customer> get_customer_by_id(id)

Retrieve Customer

Retrieves an existing Customer for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::CustomersApi.new
id = 56 # Integer | 

begin
  # Retrieve Customer
  result = api_instance.get_customer_by_id(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CustomersApi->get_customer_by_id: #{e}"
end
```

#### Using the get_customer_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Customer>, Integer, Hash)> get_customer_by_id_with_http_info(id)

```ruby
begin
  # Retrieve Customer
  data, status_code, headers = api_instance.get_customer_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Customer>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CustomersApi->get_customer_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

[**Customer**](Customer.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_customers

> <PageableCustomer> get_customers(opts)

Retrieve all Customers

Retrieves a list of all Customers

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::CustomersApi.new
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve all Customers
  result = api_instance.get_customers(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CustomersApi->get_customers: #{e}"
end
```

#### Using the get_customers_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableCustomer>, Integer, Hash)> get_customers_with_http_info(opts)

```ruby
begin
  # Retrieve all Customers
  data, status_code, headers = api_instance.get_customers_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableCustomer>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CustomersApi->get_customers_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableCustomer**](PageableCustomer.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_customer

> <Customer> update_customer(key, opts)

Update Customer

Updates the Customer with the given key using the provided input and returns the updated Customer

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::CustomersApi.new
key = 'key_example' # String | 
opts = {
  customer_input: OpenapiClient::CustomerInput.new({key: 'CLOUDBAY_DEVELOPMENT', name: 'Cloudbay: Development'}) # CustomerInput | 
}

begin
  # Update Customer
  result = api_instance.update_customer(key, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CustomersApi->update_customer: #{e}"
end
```

#### Using the update_customer_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Customer>, Integer, Hash)> update_customer_with_http_info(key, opts)

```ruby
begin
  # Update Customer
  data, status_code, headers = api_instance.update_customer_with_http_info(key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Customer>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CustomersApi->update_customer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** |  |  |
| **customer_input** | [**CustomerInput**](CustomerInput.md) |  | [optional] |

### Return type

[**Customer**](Customer.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

