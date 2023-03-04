# OpenapiClient::TeamApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_team**](TeamApi.md#create_team) | **POST** /teams | Create Team |
| [**delete_team**](TeamApi.md#delete_team) | **DELETE** /teams/{id} | Delete Team |
| [**get_team_by_id**](TeamApi.md#get_team_by_id) | **GET** /teams/{id} | Retrieve Team |
| [**get_team_links**](TeamApi.md#get_team_links) | **GET** /teams/{id}/links | Retrieve Links from Team |
| [**get_teams**](TeamApi.md#get_teams) | **GET** /teams | Retrieve Teams |
| [**update_team**](TeamApi.md#update_team) | **PUT** /teams/{id} | Update Team |


## create_team

> <Team> create_team(opts)

Create Team

Creates a new Team using the provided input and returns the newly created Team

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamApi.new
opts = {
  team_input: OpenapiClient::TeamInput.new({name: 'name_example'}) # TeamInput | 
}

begin
  # Create Team
  result = api_instance.create_team(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamApi->create_team: #{e}"
end
```

#### Using the create_team_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Team>, Integer, Hash)> create_team_with_http_info(opts)

```ruby
begin
  # Create Team
  data, status_code, headers = api_instance.create_team_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Team>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamApi->create_team_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_input** | [**TeamInput**](TeamInput.md) |  | [optional] |

### Return type

[**Team**](Team.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_team

> delete_team(id)

Delete Team

Deletes the Team for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamApi.new
id = 'id_example' # String | An id that uniquely identifies the Team

begin
  # Delete Team
  api_instance.delete_team(id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamApi->delete_team: #{e}"
end
```

#### Using the delete_team_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_team_with_http_info(id)

```ruby
begin
  # Delete Team
  data, status_code, headers = api_instance.delete_team_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamApi->delete_team_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | An id that uniquely identifies the Team |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_team_by_id

> <Team> get_team_by_id(id)

Retrieve Team

Retrieves an existing Team for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamApi.new
id = 'id_example' # String | An id that uniquely identifies the Team

begin
  # Retrieve Team
  result = api_instance.get_team_by_id(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamApi->get_team_by_id: #{e}"
end
```

#### Using the get_team_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Team>, Integer, Hash)> get_team_by_id_with_http_info(id)

```ruby
begin
  # Retrieve Team
  data, status_code, headers = api_instance.get_team_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Team>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamApi->get_team_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | An id that uniquely identifies the Team |  |

### Return type

[**Team**](Team.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_team_links

> <PageableTeamLink> get_team_links(id, opts)

Retrieve Links from Team

Retrieves a list of all Links for the given Team

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamApi.new
id = 'id_example' # String | An id that uniquely identifies the Team
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve Links from Team
  result = api_instance.get_team_links(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamApi->get_team_links: #{e}"
end
```

#### Using the get_team_links_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableTeamLink>, Integer, Hash)> get_team_links_with_http_info(id, opts)

```ruby
begin
  # Retrieve Links from Team
  data, status_code, headers = api_instance.get_team_links_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableTeamLink>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamApi->get_team_links_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | An id that uniquely identifies the Team |  |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableTeamLink**](PageableTeamLink.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_teams

> <PageableTeam> get_teams(opts)

Retrieve Teams

Retrieves a list of all existing Teams

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamApi.new
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve Teams
  result = api_instance.get_teams(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamApi->get_teams: #{e}"
end
```

#### Using the get_teams_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableTeam>, Integer, Hash)> get_teams_with_http_info(opts)

```ruby
begin
  # Retrieve Teams
  data, status_code, headers = api_instance.get_teams_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableTeam>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamApi->get_teams_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableTeam**](PageableTeam.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_team

> <Team> update_team(id, opts)

Update Team

Updates the Team for the given id using the provided input, and returns the updated Team

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamApi.new
id = 'id_example' # String | An id that uniquely identifies the Team
opts = {
  team_input: OpenapiClient::TeamInput.new({name: 'name_example'}) # TeamInput | 
}

begin
  # Update Team
  result = api_instance.update_team(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamApi->update_team: #{e}"
end
```

#### Using the update_team_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Team>, Integer, Hash)> update_team_with_http_info(id, opts)

```ruby
begin
  # Update Team
  data, status_code, headers = api_instance.update_team_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Team>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamApi->update_team_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | An id that uniquely identifies the Team |  |
| **team_input** | [**TeamInput**](TeamInput.md) |  | [optional] |

### Return type

[**Team**](Team.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

