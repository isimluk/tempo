# OpenapiClient::TeamLinksApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_team_link**](TeamLinksApi.md#create_team_link) | **POST** /team-links | Create Team Link |
| [**delete_team_link**](TeamLinksApi.md#delete_team_link) | **DELETE** /team-links/{linkId} | Delete Team Link |
| [**get_team_link**](TeamLinksApi.md#get_team_link) | **GET** /team-links/{linkId} | Retrieve Team Link |
| [**get_team_link_by_project_id**](TeamLinksApi.md#get_team_link_by_project_id) | **GET** /team-links/project/{id} | Retrieve Team Link by Project |


## create_team_link

> <TeamLink> create_team_link(opts)

Create Team Link

Creates a new Team Link using the provided input and returns the newly created Team Link

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamLinksApi.new
opts = {
  team_link_input: OpenapiClient::TeamLinkInput.new({scope_id: 37, scope_type: 'PROJECT', team_id: 37}) # TeamLinkInput | 
}

begin
  # Create Team Link
  result = api_instance.create_team_link(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamLinksApi->create_team_link: #{e}"
end
```

#### Using the create_team_link_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TeamLink>, Integer, Hash)> create_team_link_with_http_info(opts)

```ruby
begin
  # Create Team Link
  data, status_code, headers = api_instance.create_team_link_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamLink>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamLinksApi->create_team_link_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_link_input** | [**TeamLinkInput**](TeamLinkInput.md) |  | [optional] |

### Return type

[**TeamLink**](TeamLink.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_team_link

> delete_team_link(link_id)

Delete Team Link

Deletes an existing Team Link for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamLinksApi.new
link_id = 'link_id_example' # String | 

begin
  # Delete Team Link
  api_instance.delete_team_link(link_id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamLinksApi->delete_team_link: #{e}"
end
```

#### Using the delete_team_link_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_team_link_with_http_info(link_id)

```ruby
begin
  # Delete Team Link
  data, status_code, headers = api_instance.delete_team_link_with_http_info(link_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamLinksApi->delete_team_link_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **link_id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_team_link

> <TeamLink> get_team_link(link_id)

Retrieve Team Link

Retrieves an existing Team Link for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamLinksApi.new
link_id = 'link_id_example' # String | 

begin
  # Retrieve Team Link
  result = api_instance.get_team_link(link_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamLinksApi->get_team_link: #{e}"
end
```

#### Using the get_team_link_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TeamLink>, Integer, Hash)> get_team_link_with_http_info(link_id)

```ruby
begin
  # Retrieve Team Link
  data, status_code, headers = api_instance.get_team_link_with_http_info(link_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamLink>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamLinksApi->get_team_link_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **link_id** | **String** |  |  |

### Return type

[**TeamLink**](TeamLink.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_team_link_by_project_id

> <TeamLinkResults> get_team_link_by_project_id(id)

Retrieve Team Link by Project

Retrieves an existing Team Link for the given Project id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamLinksApi.new
id = 789 # Integer | 

begin
  # Retrieve Team Link by Project
  result = api_instance.get_team_link_by_project_id(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamLinksApi->get_team_link_by_project_id: #{e}"
end
```

#### Using the get_team_link_by_project_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TeamLinkResults>, Integer, Hash)> get_team_link_by_project_id_with_http_info(id)

```ruby
begin
  # Retrieve Team Link by Project
  data, status_code, headers = api_instance.get_team_link_by_project_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamLinkResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamLinksApi->get_team_link_by_project_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |

### Return type

[**TeamLinkResults**](TeamLinkResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

