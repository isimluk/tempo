# OpenapiClient::SkillAssignmentsApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**assign_skills**](SkillAssignmentsApi.md#assign_skills) | **POST** /skill-assignments | Assign Skills for Resource |
| [**get_skill_assignments**](SkillAssignmentsApi.md#get_skill_assignments) | **GET** /skill-assignments/{assigneeId}/{assigneeType} | Retrieve Skill Assignments for Resource |
| [**remove_skill_assignment**](SkillAssignmentsApi.md#remove_skill_assignment) | **DELETE** /skill-assignments/{assigneeId}/{assigneeType}/{skillId} | Delete skill of the Resource |
| [**replace_skill_assignments**](SkillAssignmentsApi.md#replace_skill_assignments) | **POST** /skill-assignments/replace | Replace skills for Resource |


## assign_skills

> <Array<Skill>> assign_skills(opts)

Assign Skills for Resource

Assigns a list of Skills for the given Resource using the provided input and returns a list of the Resource's assigned Skills. A Resource can have up to 5 Skills assigned.

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::SkillAssignmentsApi.new
opts = {
  skills_assignment_input: OpenapiClient::SkillsAssignmentInput.new({assignee_id: '123456:01234567-89ab-cdef-0123-456789abcdef | 5', assignee_type: 'USER'}) # SkillsAssignmentInput | 
}

begin
  # Assign Skills for Resource
  result = api_instance.assign_skills(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillAssignmentsApi->assign_skills: #{e}"
end
```

#### Using the assign_skills_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Skill>>, Integer, Hash)> assign_skills_with_http_info(opts)

```ruby
begin
  # Assign Skills for Resource
  data, status_code, headers = api_instance.assign_skills_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Skill>>
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillAssignmentsApi->assign_skills_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **skills_assignment_input** | [**SkillsAssignmentInput**](SkillsAssignmentInput.md) |  | [optional] |

### Return type

[**Array&lt;Skill&gt;**](Skill.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_skill_assignments

> <Array<Skill>> get_skill_assignments(assignee_id, assignee_type)

Retrieve Skill Assignments for Resource

Retrieves a list of Skill Assignments for the given Resource

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::SkillAssignmentsApi.new
assignee_id = 'assignee_id_example' # String | A string that uniquely identifies the resource
assignee_type = 'assignee_type_example' # String | A string that identifies the resource type, which can be USER or GENERIC

begin
  # Retrieve Skill Assignments for Resource
  result = api_instance.get_skill_assignments(assignee_id, assignee_type)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillAssignmentsApi->get_skill_assignments: #{e}"
end
```

#### Using the get_skill_assignments_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Skill>>, Integer, Hash)> get_skill_assignments_with_http_info(assignee_id, assignee_type)

```ruby
begin
  # Retrieve Skill Assignments for Resource
  data, status_code, headers = api_instance.get_skill_assignments_with_http_info(assignee_id, assignee_type)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Skill>>
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillAssignmentsApi->get_skill_assignments_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **assignee_id** | **String** | A string that uniquely identifies the resource |  |
| **assignee_type** | **String** | A string that identifies the resource type, which can be USER or GENERIC |  |

### Return type

[**Array&lt;Skill&gt;**](Skill.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## remove_skill_assignment

> remove_skill_assignment(assignee_id, assignee_type, skill_id)

Delete skill of the Resource

Deletes an existing Skill for the given Resource

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::SkillAssignmentsApi.new
assignee_id = 'assignee_id_example' # String | A string that uniquely identifies the resource
assignee_type = 'assignee_type_example' # String | A string that identifies the resource type, which can be USER or GENERIC
skill_id = 56 # Integer | An id that uniquely identify the Skill

begin
  # Delete skill of the Resource
  api_instance.remove_skill_assignment(assignee_id, assignee_type, skill_id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillAssignmentsApi->remove_skill_assignment: #{e}"
end
```

#### Using the remove_skill_assignment_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> remove_skill_assignment_with_http_info(assignee_id, assignee_type, skill_id)

```ruby
begin
  # Delete skill of the Resource
  data, status_code, headers = api_instance.remove_skill_assignment_with_http_info(assignee_id, assignee_type, skill_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillAssignmentsApi->remove_skill_assignment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **assignee_id** | **String** | A string that uniquely identifies the resource |  |
| **assignee_type** | **String** | A string that identifies the resource type, which can be USER or GENERIC |  |
| **skill_id** | **Integer** | An id that uniquely identify the Skill |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## replace_skill_assignments

> <Array<Skill>> replace_skill_assignments(opts)

Replace skills for Resource

Replaces Skills for the given Resource using the provided input and returns a list of the Resource's assigned Skills. A Resource can have up to 5 skills assigned.

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::SkillAssignmentsApi.new
opts = {
  skills_assignment_input: OpenapiClient::SkillsAssignmentInput.new({assignee_id: '123456:01234567-89ab-cdef-0123-456789abcdef | 5', assignee_type: 'USER'}) # SkillsAssignmentInput | 
}

begin
  # Replace skills for Resource
  result = api_instance.replace_skill_assignments(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillAssignmentsApi->replace_skill_assignments: #{e}"
end
```

#### Using the replace_skill_assignments_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Skill>>, Integer, Hash)> replace_skill_assignments_with_http_info(opts)

```ruby
begin
  # Replace skills for Resource
  data, status_code, headers = api_instance.replace_skill_assignments_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Skill>>
rescue OpenapiClient::ApiError => e
  puts "Error when calling SkillAssignmentsApi->replace_skill_assignments_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **skills_assignment_input** | [**SkillsAssignmentInput**](SkillsAssignmentInput.md) |  | [optional] |

### Return type

[**Array&lt;Skill&gt;**](Skill.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

