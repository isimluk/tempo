# OpenapiClient::ProgramApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_program**](ProgramApi.md#create_program) | **POST** /programs | Create Program |
| [**delete_program**](ProgramApi.md#delete_program) | **DELETE** /programs/{id} | Delete Program |
| [**get_program_by_id**](ProgramApi.md#get_program_by_id) | **GET** /programs/{id} | Retrieve Program |
| [**get_programs**](ProgramApi.md#get_programs) | **GET** /programs | Retrieve all Programs |
| [**get_teams_by_program_id**](ProgramApi.md#get_teams_by_program_id) | **GET** /programs/{id}/teams | Retrieve Teams associated with Program |
| [**update_program**](ProgramApi.md#update_program) | **PUT** /programs/{id} | Update Program |


## create_program

> <Program> create_program(opts)

Create Program

Creates a new Program using the provided input and returns the newly created Program

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::ProgramApi.new
opts = {
  program_input: OpenapiClient::ProgramInput.new({name: 'Program: new Season'}) # ProgramInput | 
}

begin
  # Create Program
  result = api_instance.create_program(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ProgramApi->create_program: #{e}"
end
```

#### Using the create_program_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Program>, Integer, Hash)> create_program_with_http_info(opts)

```ruby
begin
  # Create Program
  data, status_code, headers = api_instance.create_program_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Program>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ProgramApi->create_program_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **program_input** | [**ProgramInput**](ProgramInput.md) |  | [optional] |

### Return type

[**Program**](Program.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_program

> delete_program(id)

Delete Program

Deletes an existing Program for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::ProgramApi.new
id = 'id_example' # String | 

begin
  # Delete Program
  api_instance.delete_program(id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling ProgramApi->delete_program: #{e}"
end
```

#### Using the delete_program_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_program_with_http_info(id)

```ruby
begin
  # Delete Program
  data, status_code, headers = api_instance.delete_program_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling ProgramApi->delete_program_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_program_by_id

> <Program> get_program_by_id(id)

Retrieve Program

Retrieves an existing Program for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::ProgramApi.new
id = 'id_example' # String | 

begin
  # Retrieve Program
  result = api_instance.get_program_by_id(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ProgramApi->get_program_by_id: #{e}"
end
```

#### Using the get_program_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Program>, Integer, Hash)> get_program_by_id_with_http_info(id)

```ruby
begin
  # Retrieve Program
  data, status_code, headers = api_instance.get_program_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Program>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ProgramApi->get_program_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**Program**](Program.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_programs

> <ProgramResults> get_programs

Retrieve all Programs

Retrieves a list of all Programs

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::ProgramApi.new

begin
  # Retrieve all Programs
  result = api_instance.get_programs
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ProgramApi->get_programs: #{e}"
end
```

#### Using the get_programs_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ProgramResults>, Integer, Hash)> get_programs_with_http_info

```ruby
begin
  # Retrieve all Programs
  data, status_code, headers = api_instance.get_programs_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ProgramResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ProgramApi->get_programs_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ProgramResults**](ProgramResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_teams_by_program_id

> <TeamRefResults> get_teams_by_program_id(id)

Retrieve Teams associated with Program

Retrieves a list of Teams associated with the given Program

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::ProgramApi.new
id = 'id_example' # String | 

begin
  # Retrieve Teams associated with Program
  result = api_instance.get_teams_by_program_id(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ProgramApi->get_teams_by_program_id: #{e}"
end
```

#### Using the get_teams_by_program_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TeamRefResults>, Integer, Hash)> get_teams_by_program_id_with_http_info(id)

```ruby
begin
  # Retrieve Teams associated with Program
  data, status_code, headers = api_instance.get_teams_by_program_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamRefResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ProgramApi->get_teams_by_program_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**TeamRefResults**](TeamRefResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_program

> <Program> update_program(id, opts)

Update Program

Updates an existing Program for the given id using the provided input and returns the updated Program

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::ProgramApi.new
id = 'id_example' # String | 
opts = {
  program_input: OpenapiClient::ProgramInput.new({name: 'Program: new Season'}) # ProgramInput | 
}

begin
  # Update Program
  result = api_instance.update_program(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ProgramApi->update_program: #{e}"
end
```

#### Using the update_program_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Program>, Integer, Hash)> update_program_with_http_info(id, opts)

```ruby
begin
  # Update Program
  data, status_code, headers = api_instance.update_program_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Program>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ProgramApi->update_program_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **program_input** | [**ProgramInput**](ProgramInput.md) |  | [optional] |

### Return type

[**Program**](Program.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

