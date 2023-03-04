# OpenapiClient::SkillsApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_skill**](SkillsApi.md#create_skill) | **POST** /skills | Create Skill |
| [**delete_skill**](SkillsApi.md#delete_skill) | **DELETE** /skills/{id} | Delete Skill |
| [**get_skill**](SkillsApi.md#get_skill) | **GET** /skills/{id} | Retrieve Skill |
| [**get_skills**](SkillsApi.md#get_skills) | **GET** /skills | Retrieve Skills |
| [**update_skill**](SkillsApi.md#update_skill) | **PUT** /skills/{id} | Update Skill |


## create_skill

> <Skill> create_skill(opts)

Create Skill

Creates a new Skill using the provided input and returns the newly created Skill

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::SkillsApi.new
opts = {
  skill_input: OpenapiClient::SkillInput.new({name: 'Java'}) # SkillInput | 
}

begin
  # Create Skill
  result = api_instance.create_skill(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillsApi->create_skill: #{e}"
end
```

#### Using the create_skill_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Skill>, Integer, Hash)> create_skill_with_http_info(opts)

```ruby
begin
  # Create Skill
  data, status_code, headers = api_instance.create_skill_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Skill>
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillsApi->create_skill_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **skill_input** | [**SkillInput**](SkillInput.md) |  | [optional] |

### Return type

[**Skill**](Skill.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_skill

> delete_skill(id)

Delete Skill

Deletes an existing Skill for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::SkillsApi.new
id = 56 # Integer | An id that uniquely identifies the Skill

begin
  # Delete Skill
  api_instance.delete_skill(id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillsApi->delete_skill: #{e}"
end
```

#### Using the delete_skill_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_skill_with_http_info(id)

```ruby
begin
  # Delete Skill
  data, status_code, headers = api_instance.delete_skill_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillsApi->delete_skill_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An id that uniquely identifies the Skill |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_skill

> <Skill> get_skill(id)

Retrieve Skill

Retrieves an existing Skill for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::SkillsApi.new
id = 56 # Integer | An id that uniquely identifies the Skill

begin
  # Retrieve Skill
  result = api_instance.get_skill(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillsApi->get_skill: #{e}"
end
```

#### Using the get_skill_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Skill>, Integer, Hash)> get_skill_with_http_info(id)

```ruby
begin
  # Retrieve Skill
  data, status_code, headers = api_instance.get_skill_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Skill>
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillsApi->get_skill_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An id that uniquely identifies the Skill |  |

### Return type

[**Skill**](Skill.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_skills

> <PageableSkill> get_skills(opts)

Retrieve Skills

Retrieves a list of existing Skills that matches the given search parameters

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::SkillsApi.new
opts = {
  id: [37], # Array<Integer> | Ids of the Skills you want to retrieve
  query: 'query_example', # String | A query to be used for string matching against name of Skills
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve Skills
  result = api_instance.get_skills(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillsApi->get_skills: #{e}"
end
```

#### Using the get_skills_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableSkill>, Integer, Hash)> get_skills_with_http_info(opts)

```ruby
begin
  # Retrieve Skills
  data, status_code, headers = api_instance.get_skills_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableSkill>
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillsApi->get_skills_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | [**Array&lt;Integer&gt;**](Integer.md) | Ids of the Skills you want to retrieve | [optional] |
| **query** | **String** | A query to be used for string matching against name of Skills | [optional] |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableSkill**](PageableSkill.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_skill

> <Skill> update_skill(id, opts)

Update Skill

Updates an existing Skill for the given id using the provided input and returns the updated Skill

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::SkillsApi.new
id = 56 # Integer | An id that uniquely identifies the Skill
opts = {
  skill_input: OpenapiClient::SkillInput.new({name: 'Java'}) # SkillInput | 
}

begin
  # Update Skill
  result = api_instance.update_skill(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillsApi->update_skill: #{e}"
end
```

#### Using the update_skill_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Skill>, Integer, Hash)> update_skill_with_http_info(id, opts)

```ruby
begin
  # Update Skill
  data, status_code, headers = api_instance.update_skill_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Skill>
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillsApi->update_skill_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An id that uniquely identifies the Skill |  |
| **skill_input** | [**SkillInput**](SkillInput.md) |  | [optional] |

### Return type

[**Skill**](Skill.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

