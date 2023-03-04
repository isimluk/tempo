# OpenapiClient::TeamMembershipsApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_membership**](TeamMembershipsApi.md#create_membership) | **POST** /team-memberships | Create Membership |
| [**delete_membership**](TeamMembershipsApi.md#delete_membership) | **DELETE** /team-memberships/{id} | Delete Membership |
| [**get_all_memberships**](TeamMembershipsApi.md#get_all_memberships) | **GET** /team-memberships/team/{teamId} | Retrieve Memberships for Team |
| [**get_membership**](TeamMembershipsApi.md#get_membership) | **GET** /team-memberships/{id} | Retrieve Membership |
| [**update_membership**](TeamMembershipsApi.md#update_membership) | **PUT** /team-memberships/{id} | Update Membership |


## create_membership

> <TeamMembership> create_membership(opts)

Create Membership

Creates a new Membership using the provided input and returns the newly created Membership

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamMembershipsApi.new
opts = {
  team_membership_input: OpenapiClient::TeamMembershipInput.new({account_id: '1111aaaa2222bbbb3333cccc', team_id: 1}) # TeamMembershipInput | 
}

begin
  # Create Membership
  result = api_instance.create_membership(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamMembershipsApi->create_membership: #{e}"
end
```

#### Using the create_membership_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TeamMembership>, Integer, Hash)> create_membership_with_http_info(opts)

```ruby
begin
  # Create Membership
  data, status_code, headers = api_instance.create_membership_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamMembership>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamMembershipsApi->create_membership_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_membership_input** | [**TeamMembershipInput**](TeamMembershipInput.md) |  | [optional] |

### Return type

[**TeamMembership**](TeamMembership.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_membership

> delete_membership(id)

Delete Membership

Deletes an existing Membership for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamMembershipsApi.new
id = 'id_example' # String | 

begin
  # Delete Membership
  api_instance.delete_membership(id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamMembershipsApi->delete_membership: #{e}"
end
```

#### Using the delete_membership_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_membership_with_http_info(id)

```ruby
begin
  # Delete Membership
  data, status_code, headers = api_instance.delete_membership_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamMembershipsApi->delete_membership_with_http_info: #{e}"
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


## get_all_memberships

> <TeamMembershipResults> get_all_memberships(team_id)

Retrieve Memberships for Team

Retrieves a list of all the Memberships for the given Team

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamMembershipsApi.new
team_id = 'team_id_example' # String | 

begin
  # Retrieve Memberships for Team
  result = api_instance.get_all_memberships(team_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamMembershipsApi->get_all_memberships: #{e}"
end
```

#### Using the get_all_memberships_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TeamMembershipResults>, Integer, Hash)> get_all_memberships_with_http_info(team_id)

```ruby
begin
  # Retrieve Memberships for Team
  data, status_code, headers = api_instance.get_all_memberships_with_http_info(team_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamMembershipResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamMembershipsApi->get_all_memberships_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_id** | **String** |  |  |

### Return type

[**TeamMembershipResults**](TeamMembershipResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_membership

> <TeamMembership> get_membership(id)

Retrieve Membership

Retrieves an existing Membership for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamMembershipsApi.new
id = 'id_example' # String | 

begin
  # Retrieve Membership
  result = api_instance.get_membership(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamMembershipsApi->get_membership: #{e}"
end
```

#### Using the get_membership_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TeamMembership>, Integer, Hash)> get_membership_with_http_info(id)

```ruby
begin
  # Retrieve Membership
  data, status_code, headers = api_instance.get_membership_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamMembership>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamMembershipsApi->get_membership_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**TeamMembership**](TeamMembership.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_membership

> <TeamMembership> update_membership(id, opts)

Update Membership

Updates an existing Membership using the provided input and returns the updated Membership

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TeamMembershipsApi.new
id = 'id_example' # String | 
opts = {
  membership_input: OpenapiClient::MembershipInput.new # MembershipInput | 
}

begin
  # Update Membership
  result = api_instance.update_membership(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamMembershipsApi->update_membership: #{e}"
end
```

#### Using the update_membership_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TeamMembership>, Integer, Hash)> update_membership_with_http_info(id, opts)

```ruby
begin
  # Update Membership
  data, status_code, headers = api_instance.update_membership_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamMembership>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TeamMembershipsApi->update_membership_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **membership_input** | [**MembershipInput**](MembershipInput.md) |  | [optional] |

### Return type

[**TeamMembership**](TeamMembership.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

