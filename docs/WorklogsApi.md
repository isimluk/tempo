# OpenapiClient::WorklogsApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_work_attribute_values_for_worklogs**](WorklogsApi.md#create_work_attribute_values_for_worklogs) | **POST** /worklogs/work-attribute-values | Bulk create Work Attribute values for Worklogs |
| [**create_worklog**](WorklogsApi.md#create_worklog) | **POST** /worklogs | Create Worklog |
| [**delete_worklog**](WorklogsApi.md#delete_worklog) | **DELETE** /worklogs/{id} | Delete Worklog  |
| [**get_jira_worklog_ids_by_tempo_worklog_ids**](WorklogsApi.md#get_jira_worklog_ids_by_tempo_worklog_ids) | **POST** /worklogs/tempo-to-jira | Retrieve Jira Worklog ids by Tempo Worklog ids |
| [**get_work_attribute_value_for_worklog**](WorklogsApi.md#get_work_attribute_value_for_worklog) | **GET** /worklogs/{id}/work-attribute-values/{key} | Retrieve Work Attribute value for Worklog |
| [**get_work_attribute_values_for_worklog**](WorklogsApi.md#get_work_attribute_values_for_worklog) | **GET** /worklogs/{id}/work-attribute-values | Retrieve Work Attribute values for Worklog |
| [**get_worklog_by_id**](WorklogsApi.md#get_worklog_by_id) | **GET** /worklogs/{id} | Retrieve Worklog |
| [**get_worklogs**](WorklogsApi.md#get_worklogs) | **GET** /worklogs | Retrieve Worklogs |
| [**get_worklogs_by_account**](WorklogsApi.md#get_worklogs_by_account) | **GET** /worklogs/account/{accountKey} | Search Worklogs associated to Account |
| [**get_worklogs_by_issue_id**](WorklogsApi.md#get_worklogs_by_issue_id) | **GET** /worklogs/issue/{issueId} | Search Worklogs associated to Issue id |
| [**get_worklogs_by_project_id**](WorklogsApi.md#get_worklogs_by_project_id) | **GET** /worklogs/project/{projectId} | Retrieve Worklogs associated to projectId |
| [**get_worklogs_by_team**](WorklogsApi.md#get_worklogs_by_team) | **GET** /worklogs/team/{teamId} | Search Worklogs associated to Team |
| [**get_worklogs_by_user**](WorklogsApi.md#get_worklogs_by_user) | **GET** /worklogs/user/{accountId} | Search Worklogs associated to User |
| [**search_worklogs**](WorklogsApi.md#search_worklogs) | **POST** /worklogs/search | Search Worklogs |
| [**update_worklog**](WorklogsApi.md#update_worklog) | **PUT** /worklogs/{id} | Update Worklog |


## create_work_attribute_values_for_worklogs

> create_work_attribute_values_for_worklogs(opts)

Bulk create Work Attribute values for Worklogs

Note: This API only supports creating new Work Attribute values. Work Attribute values can only be updated as part of the Worklog.

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
opts = {
  work_attribute_values_input: [OpenapiClient::WorkAttributeValuesInput.new({attribute_values: [OpenapiClient::WorkAttributeValueInput.new({key: '_COLOR_'})], tempo_worklog_id: 128})] # Array<WorkAttributeValuesInput> | 
}

begin
  # Bulk create Work Attribute values for Worklogs
  api_instance.create_work_attribute_values_for_worklogs(opts)
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->create_work_attribute_values_for_worklogs: #{e}"
end
```

#### Using the create_work_attribute_values_for_worklogs_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_work_attribute_values_for_worklogs_with_http_info(opts)

```ruby
begin
  # Bulk create Work Attribute values for Worklogs
  data, status_code, headers = api_instance.create_work_attribute_values_for_worklogs_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->create_work_attribute_values_for_worklogs_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **work_attribute_values_input** | [**Array&lt;WorkAttributeValuesInput&gt;**](WorkAttributeValuesInput.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## create_worklog

> <Worklog> create_worklog(opts)

Create Worklog

Creates a new Worklog using the provided input and returns the newly created Worklog

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
opts = {
  worklog_input: OpenapiClient::WorklogInput.new({author_account_id: '1111aaaa2222bbbb3333cccc', issue_id: 10001, start_date: Date.today, time_spent_seconds: 3600}) # WorklogInput | 
}

begin
  # Create Worklog
  result = api_instance.create_worklog(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->create_worklog: #{e}"
end
```

#### Using the create_worklog_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Worklog>, Integer, Hash)> create_worklog_with_http_info(opts)

```ruby
begin
  # Create Worklog
  data, status_code, headers = api_instance.create_worklog_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Worklog>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->create_worklog_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **worklog_input** | [**WorklogInput**](WorklogInput.md) |  | [optional] |

### Return type

[**Worklog**](Worklog.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_worklog

> delete_worklog(id)

Delete Worklog 

Deletes an existing Worklog for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
id = 'id_example' # String | 

begin
  # Delete Worklog 
  api_instance.delete_worklog(id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->delete_worklog: #{e}"
end
```

#### Using the delete_worklog_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_worklog_with_http_info(id)

```ruby
begin
  # Delete Worklog 
  data, status_code, headers = api_instance.delete_worklog_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->delete_worklog_with_http_info: #{e}"
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


## get_jira_worklog_ids_by_tempo_worklog_ids

> <PageableTempoToJiraWorklogId> get_jira_worklog_ids_by_tempo_worklog_ids(opts)

Retrieve Jira Worklog ids by Tempo Worklog ids

Retrieves a list of existing Jira Worklog ids that match the informed Tempo Worklog ids. If a Jira Worklog Id cannot be found, it will not be returned on the results

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56, # Integer | Limit the number of elements on the response
  tempo_worklog_id_list: OpenapiClient::TempoWorklogIdList.new({tempo_worklog_ids: [1, 2, 3, 4, 5]}) # TempoWorklogIdList | 
}

begin
  # Retrieve Jira Worklog ids by Tempo Worklog ids
  result = api_instance.get_jira_worklog_ids_by_tempo_worklog_ids(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_jira_worklog_ids_by_tempo_worklog_ids: #{e}"
end
```

#### Using the get_jira_worklog_ids_by_tempo_worklog_ids_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableTempoToJiraWorklogId>, Integer, Hash)> get_jira_worklog_ids_by_tempo_worklog_ids_with_http_info(opts)

```ruby
begin
  # Retrieve Jira Worklog ids by Tempo Worklog ids
  data, status_code, headers = api_instance.get_jira_worklog_ids_by_tempo_worklog_ids_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableTempoToJiraWorklogId>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_jira_worklog_ids_by_tempo_worklog_ids_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |
| **tempo_worklog_id_list** | [**TempoWorklogIdList**](TempoWorklogIdList.md) |  | [optional] |

### Return type

[**PageableTempoToJiraWorklogId**](PageableTempoToJiraWorklogId.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_work_attribute_value_for_worklog

> <WorkAttributeValue> get_work_attribute_value_for_worklog(id, key)

Retrieve Work Attribute value for Worklog

Retrieves a specific Work Attribute value using the provided key, for the given Worklog

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
id = 'id_example' # String | 
key = 'key_example' # String | 

begin
  # Retrieve Work Attribute value for Worklog
  result = api_instance.get_work_attribute_value_for_worklog(id, key)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_work_attribute_value_for_worklog: #{e}"
end
```

#### Using the get_work_attribute_value_for_worklog_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WorkAttributeValue>, Integer, Hash)> get_work_attribute_value_for_worklog_with_http_info(id, key)

```ruby
begin
  # Retrieve Work Attribute value for Worklog
  data, status_code, headers = api_instance.get_work_attribute_value_for_worklog_with_http_info(id, key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WorkAttributeValue>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_work_attribute_value_for_worklog_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **key** | **String** |  |  |

### Return type

[**WorkAttributeValue**](WorkAttributeValue.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_work_attribute_values_for_worklog

> <WorkAttributeValueResults> get_work_attribute_values_for_worklog(id)

Retrieve Work Attribute values for Worklog

Retrieves a list of all Work Attribute values for the given Worklog

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
id = 'id_example' # String | 

begin
  # Retrieve Work Attribute values for Worklog
  result = api_instance.get_work_attribute_values_for_worklog(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_work_attribute_values_for_worklog: #{e}"
end
```

#### Using the get_work_attribute_values_for_worklog_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WorkAttributeValueResults>, Integer, Hash)> get_work_attribute_values_for_worklog_with_http_info(id)

```ruby
begin
  # Retrieve Work Attribute values for Worklog
  data, status_code, headers = api_instance.get_work_attribute_values_for_worklog_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WorkAttributeValueResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_work_attribute_values_for_worklog_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**WorkAttributeValueResults**](WorkAttributeValueResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_worklog_by_id

> <Worklog> get_worklog_by_id(id)

Retrieve Worklog

Retrieves an existing Worklog for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
id = 'id_example' # String | 

begin
  # Retrieve Worklog
  result = api_instance.get_worklog_by_id(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklog_by_id: #{e}"
end
```

#### Using the get_worklog_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Worklog>, Integer, Hash)> get_worklog_by_id_with_http_info(id)

```ruby
begin
  # Retrieve Worklog
  data, status_code, headers = api_instance.get_worklog_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Worklog>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklog_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |

### Return type

[**Worklog**](Worklog.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_worklogs

> <PageableWorklog> get_worklogs(opts)

Retrieve Worklogs

Retrieves a list of Worklogs that matches the given search parameters

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
opts = {
  project_id: [3.56], # Array<Integer> | Retrieve only worklogs for the given project ids
  issue_id: [3.56], # Array<Integer> | Retrieve only worklogs for the given issue ids
  from: 'from_example', # String | Retrieve results starting with this date
  to: 'to_example', # String | Retrieve results up to and including this date
  updated_from: 'updated_from_example', # String | Retrieve results that have been updated from this date
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve Worklogs
  result = api_instance.get_worklogs(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklogs: #{e}"
end
```

#### Using the get_worklogs_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableWorklog>, Integer, Hash)> get_worklogs_with_http_info(opts)

```ruby
begin
  # Retrieve Worklogs
  data, status_code, headers = api_instance.get_worklogs_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableWorklog>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklogs_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_id** | [**Array&lt;Integer&gt;**](Integer.md) | Retrieve only worklogs for the given project ids | [optional] |
| **issue_id** | [**Array&lt;Integer&gt;**](Integer.md) | Retrieve only worklogs for the given issue ids | [optional] |
| **from** | **String** | Retrieve results starting with this date | [optional] |
| **to** | **String** | Retrieve results up to and including this date | [optional] |
| **updated_from** | **String** | Retrieve results that have been updated from this date | [optional] |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableWorklog**](PageableWorklog.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_worklogs_by_account

> <PageableWorklog> get_worklogs_by_account(account_key, opts)

Search Worklogs associated to Account

Retrieves a list of all Worklogs associated to the given Account key that matches the search parameters

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
account_key = 'account_key_example' # String | 
opts = {
  from: 'from_example', # String | Retrieve results starting with this date
  to: 'to_example', # String | Retrieve results up to and including this date
  updated_from: 'updated_from_example', # String | Retrieve results that have been updated from this date
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Search Worklogs associated to Account
  result = api_instance.get_worklogs_by_account(account_key, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklogs_by_account: #{e}"
end
```

#### Using the get_worklogs_by_account_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableWorklog>, Integer, Hash)> get_worklogs_by_account_with_http_info(account_key, opts)

```ruby
begin
  # Search Worklogs associated to Account
  data, status_code, headers = api_instance.get_worklogs_by_account_with_http_info(account_key, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableWorklog>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklogs_by_account_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_key** | **String** |  |  |
| **from** | **String** | Retrieve results starting with this date | [optional] |
| **to** | **String** | Retrieve results up to and including this date | [optional] |
| **updated_from** | **String** | Retrieve results that have been updated from this date | [optional] |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableWorklog**](PageableWorklog.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_worklogs_by_issue_id

> <PageableWorklog> get_worklogs_by_issue_id(issue_id, opts)

Search Worklogs associated to Issue id

Retrieves a list of all Worklogs associated to the given Issue id that matches the search parameters

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
issue_id = 789 # Integer | 
opts = {
  from: 'from_example', # String | Retrieve results starting with this date
  to: 'to_example', # String | Retrieve results up to and including this date
  updated_from: 'updated_from_example', # String | Retrieve results that have been updated from this date
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Search Worklogs associated to Issue id
  result = api_instance.get_worklogs_by_issue_id(issue_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklogs_by_issue_id: #{e}"
end
```

#### Using the get_worklogs_by_issue_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableWorklog>, Integer, Hash)> get_worklogs_by_issue_id_with_http_info(issue_id, opts)

```ruby
begin
  # Search Worklogs associated to Issue id
  data, status_code, headers = api_instance.get_worklogs_by_issue_id_with_http_info(issue_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableWorklog>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklogs_by_issue_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **issue_id** | **Integer** |  |  |
| **from** | **String** | Retrieve results starting with this date | [optional] |
| **to** | **String** | Retrieve results up to and including this date | [optional] |
| **updated_from** | **String** | Retrieve results that have been updated from this date | [optional] |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableWorklog**](PageableWorklog.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_worklogs_by_project_id

> <PageableWorklog> get_worklogs_by_project_id(project_id, opts)

Retrieve Worklogs associated to projectId

Retrieves a list of all Worklogs associated to the given projectId that matches the search parameters

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
project_id = 789 # Integer | Id of the project you want to retrieve Worklogs for
opts = {
  from: 'from_example', # String | Retrieve results starting with this date
  to: 'to_example', # String | Retrieve results up to and including this date
  updated_from: 'updated_from_example', # String | Retrieve results that have been updated from this date
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Retrieve Worklogs associated to projectId
  result = api_instance.get_worklogs_by_project_id(project_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklogs_by_project_id: #{e}"
end
```

#### Using the get_worklogs_by_project_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableWorklog>, Integer, Hash)> get_worklogs_by_project_id_with_http_info(project_id, opts)

```ruby
begin
  # Retrieve Worklogs associated to projectId
  data, status_code, headers = api_instance.get_worklogs_by_project_id_with_http_info(project_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableWorklog>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklogs_by_project_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **project_id** | **Integer** | Id of the project you want to retrieve Worklogs for |  |
| **from** | **String** | Retrieve results starting with this date | [optional] |
| **to** | **String** | Retrieve results up to and including this date | [optional] |
| **updated_from** | **String** | Retrieve results that have been updated from this date | [optional] |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableWorklog**](PageableWorklog.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_worklogs_by_team

> <PageableWorklog> get_worklogs_by_team(team_id, opts)

Search Worklogs associated to Team

Retrieve a list of all Worklogs associated to the given Team id that matches the search parameters

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
team_id = 'team_id_example' # String | 
opts = {
  from: 'from_example', # String | Retrieve results starting with this date
  to: 'to_example', # String | Retrieve results up to and including this date
  updated_from: 'updated_from_example', # String | Retrieve results that have been updated from this date
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Search Worklogs associated to Team
  result = api_instance.get_worklogs_by_team(team_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklogs_by_team: #{e}"
end
```

#### Using the get_worklogs_by_team_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableWorklog>, Integer, Hash)> get_worklogs_by_team_with_http_info(team_id, opts)

```ruby
begin
  # Search Worklogs associated to Team
  data, status_code, headers = api_instance.get_worklogs_by_team_with_http_info(team_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableWorklog>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklogs_by_team_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_id** | **String** |  |  |
| **from** | **String** | Retrieve results starting with this date | [optional] |
| **to** | **String** | Retrieve results up to and including this date | [optional] |
| **updated_from** | **String** | Retrieve results that have been updated from this date | [optional] |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableWorklog**](PageableWorklog.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_worklogs_by_user

> <PageableWorklog> get_worklogs_by_user(account_id, opts)

Search Worklogs associated to User

Retrieves a list of all Worklogs associated to the given User that matches the search parameters

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
account_id = 'account_id_example' # String | 
opts = {
  from: 'from_example', # String | Retrieve results starting with this date
  to: 'to_example', # String | Retrieve results up to and including this date
  updated_from: 'updated_from_example', # String | Retrieve results that have been updated from this date
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Search Worklogs associated to User
  result = api_instance.get_worklogs_by_user(account_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklogs_by_user: #{e}"
end
```

#### Using the get_worklogs_by_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableWorklog>, Integer, Hash)> get_worklogs_by_user_with_http_info(account_id, opts)

```ruby
begin
  # Search Worklogs associated to User
  data, status_code, headers = api_instance.get_worklogs_by_user_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableWorklog>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->get_worklogs_by_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **from** | **String** | Retrieve results starting with this date | [optional] |
| **to** | **String** | Retrieve results up to and including this date | [optional] |
| **updated_from** | **String** | Retrieve results that have been updated from this date | [optional] |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableWorklog**](PageableWorklog.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_worklogs

> <PageableWorklog> search_worklogs(opts)

Search Worklogs

Retrieves a list of existing Worklogs that matches the given search parameters

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56, # Integer | Limit the number of elements on the response
  worklog_search_input: OpenapiClient::WorklogSearchInput.new # WorklogSearchInput | 
}

begin
  # Search Worklogs
  result = api_instance.search_worklogs(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->search_worklogs: #{e}"
end
```

#### Using the search_worklogs_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableWorklog>, Integer, Hash)> search_worklogs_with_http_info(opts)

```ruby
begin
  # Search Worklogs
  data, status_code, headers = api_instance.search_worklogs_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableWorklog>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->search_worklogs_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |
| **worklog_search_input** | [**WorklogSearchInput**](WorklogSearchInput.md) |  | [optional] |

### Return type

[**PageableWorklog**](PageableWorklog.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_worklog

> <Worklog> update_worklog(id, opts)

Update Worklog

Updates an existing Worklog for the given id using the provided input and returns the updated Worklog

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::WorklogsApi.new
id = 'id_example' # String | 
opts = {
  worklog_input: OpenapiClient::WorklogInput.new({author_account_id: '1111aaaa2222bbbb3333cccc', issue_id: 10001, start_date: Date.today, time_spent_seconds: 3600}) # WorklogInput | 
}

begin
  # Update Worklog
  result = api_instance.update_worklog(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->update_worklog: #{e}"
end
```

#### Using the update_worklog_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Worklog>, Integer, Hash)> update_worklog_with_http_info(id, opts)

```ruby
begin
  # Update Worklog
  data, status_code, headers = api_instance.update_worklog_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Worklog>
rescue OpenapiClient::ApiError => e
  puts "Error when calling WorklogsApi->update_worklog_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **worklog_input** | [**WorklogInput**](WorklogInput.md) |  | [optional] |

### Return type

[**Worklog**](Worklog.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

