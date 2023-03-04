# OpenapiClient::GenericResourceTeamMembersApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**add_resource_to_team**](GenericResourceTeamMembersApi.md#add_resource_to_team) | **POST** /teams/{teamId}/generic-resources | Add Generic Resource to Team |
| [**get_generic_resource_team_member**](GenericResourceTeamMembersApi.md#get_generic_resource_team_member) | **GET** /teams/{teamId}/generic-resources/{resourceId} | Retrieve Generic Resource for Team |
| [**get_resources_in_team**](GenericResourceTeamMembersApi.md#get_resources_in_team) | **GET** /teams/{teamId}/generic-resources | Retrieve Generic Resources for Team |
| [**remove_generic_resource_from_team**](GenericResourceTeamMembersApi.md#remove_generic_resource_from_team) | **DELETE** /teams/{teamId}/generic-resources/{resourceId} | Delete Generic Resource from Team |


## add_resource_to_team

> <GenericResourceTeamMember> add_resource_to_team(team_id, opts)

Add Generic Resource to Team

Adds Generic Resource to the given Team

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::GenericResourceTeamMembersApi.new
team_id = 56 # Integer | An id that uniquely identifies the Team which the generic resource is to be a member of
opts = {
  generic_resource_team_member_input: OpenapiClient::GenericResourceTeamMemberInput.new({generic_resource_id: 7}) # GenericResourceTeamMemberInput | 
}

begin
  # Add Generic Resource to Team
  result = api_instance.add_resource_to_team(team_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourceTeamMembersApi->add_resource_to_team: #{e}"
end
```

#### Using the add_resource_to_team_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenericResourceTeamMember>, Integer, Hash)> add_resource_to_team_with_http_info(team_id, opts)

```ruby
begin
  # Add Generic Resource to Team
  data, status_code, headers = api_instance.add_resource_to_team_with_http_info(team_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenericResourceTeamMember>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourceTeamMembersApi->add_resource_to_team_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_id** | **Integer** | An id that uniquely identifies the Team which the generic resource is to be a member of |  |
| **generic_resource_team_member_input** | [**GenericResourceTeamMemberInput**](GenericResourceTeamMemberInput.md) |  | [optional] |

### Return type

[**GenericResourceTeamMember**](GenericResourceTeamMember.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_generic_resource_team_member

> <GenericResourceTeamMember> get_generic_resource_team_member(team_id, resource_id)

Retrieve Generic Resource for Team

Retrieves an existing Generic Resource from the given Team

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::GenericResourceTeamMembersApi.new
team_id = 56 # Integer | An id that uniquely identifies the Team
resource_id = 56 # Integer | An id that uniquely identifies the Generic Resource

begin
  # Retrieve Generic Resource for Team
  result = api_instance.get_generic_resource_team_member(team_id, resource_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourceTeamMembersApi->get_generic_resource_team_member: #{e}"
end
```

#### Using the get_generic_resource_team_member_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenericResourceTeamMember>, Integer, Hash)> get_generic_resource_team_member_with_http_info(team_id, resource_id)

```ruby
begin
  # Retrieve Generic Resource for Team
  data, status_code, headers = api_instance.get_generic_resource_team_member_with_http_info(team_id, resource_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenericResourceTeamMember>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourceTeamMembersApi->get_generic_resource_team_member_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_id** | **Integer** | An id that uniquely identifies the Team |  |
| **resource_id** | **Integer** | An id that uniquely identifies the Generic Resource |  |

### Return type

[**GenericResourceTeamMember**](GenericResourceTeamMember.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_resources_in_team

> <GenericResourceTeamMembers> get_resources_in_team(team_id)

Retrieve Generic Resources for Team

Retrieves a list of all Generic Resources that are members of the given Team

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::GenericResourceTeamMembersApi.new
team_id = 56 # Integer | An id that uniquely identifies the Team from which generic resources are to be retrieved

begin
  # Retrieve Generic Resources for Team
  result = api_instance.get_resources_in_team(team_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourceTeamMembersApi->get_resources_in_team: #{e}"
end
```

#### Using the get_resources_in_team_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenericResourceTeamMembers>, Integer, Hash)> get_resources_in_team_with_http_info(team_id)

```ruby
begin
  # Retrieve Generic Resources for Team
  data, status_code, headers = api_instance.get_resources_in_team_with_http_info(team_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenericResourceTeamMembers>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourceTeamMembersApi->get_resources_in_team_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_id** | **Integer** | An id that uniquely identifies the Team from which generic resources are to be retrieved |  |

### Return type

[**GenericResourceTeamMembers**](GenericResourceTeamMembers.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## remove_generic_resource_from_team

> remove_generic_resource_from_team(team_id, resource_id)

Delete Generic Resource from Team

Deletes an existing Generic Resource from the given Team

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::GenericResourceTeamMembersApi.new
team_id = 56 # Integer | An id that uniquely identifies the Team
resource_id = 56 # Integer | An id that uniquely identifies the Generic Resource

begin
  # Delete Generic Resource from Team
  api_instance.remove_generic_resource_from_team(team_id, resource_id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourceTeamMembersApi->remove_generic_resource_from_team: #{e}"
end
```

#### Using the remove_generic_resource_from_team_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> remove_generic_resource_from_team_with_http_info(team_id, resource_id)

```ruby
begin
  # Delete Generic Resource from Team
  data, status_code, headers = api_instance.remove_generic_resource_from_team_with_http_info(team_id, resource_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling GenericResourceTeamMembersApi->remove_generic_resource_from_team_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_id** | **Integer** | An id that uniquely identifies the Team |  |
| **resource_id** | **Integer** | An id that uniquely identifies the Generic Resource |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

