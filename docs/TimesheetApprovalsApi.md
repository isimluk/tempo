# OpenapiClient::TimesheetApprovalsApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**approve_timesheet_for_user**](TimesheetApprovalsApi.md#approve_timesheet_for_user) | **POST** /timesheet-approvals/user/{accountId}/approve | Approve Timesheet |
| [**get_timesheet_approval_for_team**](TimesheetApprovalsApi.md#get_timesheet_approval_for_team) | **GET** /timesheet-approvals/team/{teamId} | Retrieve Timesheet Approval for Team |
| [**get_timesheet_approval_for_user**](TimesheetApprovalsApi.md#get_timesheet_approval_for_user) | **GET** /timesheet-approvals/user/{accountId} | Retrieve current Timesheet approval |
| [**get_timesheet_approvals_waiting_for_approval**](TimesheetApprovalsApi.md#get_timesheet_approvals_waiting_for_approval) | **GET** /timesheet-approvals/waiting | Retrieve Timesheets waiting for approval |
| [**get_timesheet_reviewers_for_user**](TimesheetApprovalsApi.md#get_timesheet_reviewers_for_user) | **GET** /timesheet-approvals/user/{accountId}/reviewers | Retrieve Timesheet reviewers for User |
| [**reject_timesheet_for_user**](TimesheetApprovalsApi.md#reject_timesheet_for_user) | **POST** /timesheet-approvals/user/{accountId}/reject | Reject Timesheet |
| [**reopen_timesheet_for_user**](TimesheetApprovalsApi.md#reopen_timesheet_for_user) | **POST** /timesheet-approvals/user/{accountId}/reopen | Reopen Timesheet |
| [**submit_timesheet_for_user**](TimesheetApprovalsApi.md#submit_timesheet_for_user) | **POST** /timesheet-approvals/user/{accountId}/submit | Submit Timesheet |


## approve_timesheet_for_user

> <TimesheetApproval> approve_timesheet_for_user(account_id, from, opts)

Approve Timesheet

Approves a Timesheet for the given User in the given period and returns the approved Timesheet

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TimesheetApprovalsApi.new
account_id = 'account_id_example' # String | 
from = 'from_example' # String | The Start Date in format yyyy-mm-dd
opts = {
  to: 'to_example', # String | The End Date in format yyyy-mm-dd
  timesheet_approval_input: OpenapiClient::TimesheetApprovalInput.new # TimesheetApprovalInput | 
}

begin
  # Approve Timesheet
  result = api_instance.approve_timesheet_for_user(account_id, from, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->approve_timesheet_for_user: #{e}"
end
```

#### Using the approve_timesheet_for_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TimesheetApproval>, Integer, Hash)> approve_timesheet_for_user_with_http_info(account_id, from, opts)

```ruby
begin
  # Approve Timesheet
  data, status_code, headers = api_instance.approve_timesheet_for_user_with_http_info(account_id, from, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TimesheetApproval>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->approve_timesheet_for_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **from** | **String** | The Start Date in format yyyy-mm-dd |  |
| **to** | **String** | The End Date in format yyyy-mm-dd | [optional] |
| **timesheet_approval_input** | [**TimesheetApprovalInput**](TimesheetApprovalInput.md) |  | [optional] |

### Return type

[**TimesheetApproval**](TimesheetApproval.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_timesheet_approval_for_team

> <TimesheetApprovalResults> get_timesheet_approval_for_team(team_id, from, opts)

Retrieve Timesheet Approval for Team

Retrieves the current Timesheet Approval for a Team in the given period

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TimesheetApprovalsApi.new
team_id = 'team_id_example' # String | 
from = 'from_example' # String | The Start Date in format yyyy-mm-dd
opts = {
  to: 'to_example' # String | The End Date in format yyyy-mm-dd
}

begin
  # Retrieve Timesheet Approval for Team
  result = api_instance.get_timesheet_approval_for_team(team_id, from, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->get_timesheet_approval_for_team: #{e}"
end
```

#### Using the get_timesheet_approval_for_team_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TimesheetApprovalResults>, Integer, Hash)> get_timesheet_approval_for_team_with_http_info(team_id, from, opts)

```ruby
begin
  # Retrieve Timesheet Approval for Team
  data, status_code, headers = api_instance.get_timesheet_approval_for_team_with_http_info(team_id, from, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TimesheetApprovalResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->get_timesheet_approval_for_team_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **team_id** | **String** |  |  |
| **from** | **String** | The Start Date in format yyyy-mm-dd |  |
| **to** | **String** | The End Date in format yyyy-mm-dd | [optional] |

### Return type

[**TimesheetApprovalResults**](TimesheetApprovalResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_timesheet_approval_for_user

> <TimesheetApproval> get_timesheet_approval_for_user(account_id, from, opts)

Retrieve current Timesheet approval

Retrieves the current Timesheet approval for a User in the given period

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TimesheetApprovalsApi.new
account_id = 'account_id_example' # String | 
from = 'from_example' # String | The Start Date in format yyyy-mm-dd
opts = {
  to: 'to_example' # String | The End Date in format yyyy-mm-dd
}

begin
  # Retrieve current Timesheet approval
  result = api_instance.get_timesheet_approval_for_user(account_id, from, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->get_timesheet_approval_for_user: #{e}"
end
```

#### Using the get_timesheet_approval_for_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TimesheetApproval>, Integer, Hash)> get_timesheet_approval_for_user_with_http_info(account_id, from, opts)

```ruby
begin
  # Retrieve current Timesheet approval
  data, status_code, headers = api_instance.get_timesheet_approval_for_user_with_http_info(account_id, from, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TimesheetApproval>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->get_timesheet_approval_for_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **from** | **String** | The Start Date in format yyyy-mm-dd |  |
| **to** | **String** | The End Date in format yyyy-mm-dd | [optional] |

### Return type

[**TimesheetApproval**](TimesheetApproval.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_timesheet_approvals_waiting_for_approval

> <TimesheetApprovalResults> get_timesheet_approvals_waiting_for_approval

Retrieve Timesheets waiting for approval

Retrieves a list of all Timesheets waiting for approval

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TimesheetApprovalsApi.new

begin
  # Retrieve Timesheets waiting for approval
  result = api_instance.get_timesheet_approvals_waiting_for_approval
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->get_timesheet_approvals_waiting_for_approval: #{e}"
end
```

#### Using the get_timesheet_approvals_waiting_for_approval_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TimesheetApprovalResults>, Integer, Hash)> get_timesheet_approvals_waiting_for_approval_with_http_info

```ruby
begin
  # Retrieve Timesheets waiting for approval
  data, status_code, headers = api_instance.get_timesheet_approvals_waiting_for_approval_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TimesheetApprovalResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->get_timesheet_approvals_waiting_for_approval_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**TimesheetApprovalResults**](TimesheetApprovalResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_timesheet_reviewers_for_user

> <UserResults> get_timesheet_reviewers_for_user(account_id)

Retrieve Timesheet reviewers for User

Retrieves a list of the Timesheet reviewers for the given User

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TimesheetApprovalsApi.new
account_id = 'account_id_example' # String | 

begin
  # Retrieve Timesheet reviewers for User
  result = api_instance.get_timesheet_reviewers_for_user(account_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->get_timesheet_reviewers_for_user: #{e}"
end
```

#### Using the get_timesheet_reviewers_for_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UserResults>, Integer, Hash)> get_timesheet_reviewers_for_user_with_http_info(account_id)

```ruby
begin
  # Retrieve Timesheet reviewers for User
  data, status_code, headers = api_instance.get_timesheet_reviewers_for_user_with_http_info(account_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UserResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->get_timesheet_reviewers_for_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |

### Return type

[**UserResults**](UserResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## reject_timesheet_for_user

> <TimesheetApproval> reject_timesheet_for_user(account_id, from, opts)

Reject Timesheet

Rejects a Timesheet for the given User in the given period and returns the rejected Timesheet

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TimesheetApprovalsApi.new
account_id = 'account_id_example' # String | 
from = 'from_example' # String | The Start Date in format yyyy-mm-dd
opts = {
  to: 'to_example', # String | The End Date in format yyyy-mm-dd
  timesheet_approval_input: OpenapiClient::TimesheetApprovalInput.new # TimesheetApprovalInput | 
}

begin
  # Reject Timesheet
  result = api_instance.reject_timesheet_for_user(account_id, from, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->reject_timesheet_for_user: #{e}"
end
```

#### Using the reject_timesheet_for_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TimesheetApproval>, Integer, Hash)> reject_timesheet_for_user_with_http_info(account_id, from, opts)

```ruby
begin
  # Reject Timesheet
  data, status_code, headers = api_instance.reject_timesheet_for_user_with_http_info(account_id, from, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TimesheetApproval>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->reject_timesheet_for_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **from** | **String** | The Start Date in format yyyy-mm-dd |  |
| **to** | **String** | The End Date in format yyyy-mm-dd | [optional] |
| **timesheet_approval_input** | [**TimesheetApprovalInput**](TimesheetApprovalInput.md) |  | [optional] |

### Return type

[**TimesheetApproval**](TimesheetApproval.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## reopen_timesheet_for_user

> <TimesheetApproval> reopen_timesheet_for_user(account_id, from, opts)

Reopen Timesheet

Reopens a Timesheet for the given User in the given period and returns the reopened Timesheet

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TimesheetApprovalsApi.new
account_id = 'account_id_example' # String | 
from = 'from_example' # String | The Start Date in format yyyy-mm-dd
opts = {
  to: 'to_example', # String | The End Date in format yyyy-mm-dd
  timesheet_approval_input: OpenapiClient::TimesheetApprovalInput.new # TimesheetApprovalInput | 
}

begin
  # Reopen Timesheet
  result = api_instance.reopen_timesheet_for_user(account_id, from, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->reopen_timesheet_for_user: #{e}"
end
```

#### Using the reopen_timesheet_for_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TimesheetApproval>, Integer, Hash)> reopen_timesheet_for_user_with_http_info(account_id, from, opts)

```ruby
begin
  # Reopen Timesheet
  data, status_code, headers = api_instance.reopen_timesheet_for_user_with_http_info(account_id, from, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TimesheetApproval>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->reopen_timesheet_for_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **from** | **String** | The Start Date in format yyyy-mm-dd |  |
| **to** | **String** | The End Date in format yyyy-mm-dd | [optional] |
| **timesheet_approval_input** | [**TimesheetApprovalInput**](TimesheetApprovalInput.md) |  | [optional] |

### Return type

[**TimesheetApproval**](TimesheetApproval.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_timesheet_for_user

> <TimesheetApproval> submit_timesheet_for_user(account_id, from, opts)

Submit Timesheet

Submits a Timesheet for the given User in the given period and returns the submitted Timesheet

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::TimesheetApprovalsApi.new
account_id = 'account_id_example' # String | 
from = 'from_example' # String | The Start Date in format yyyy-mm-dd
opts = {
  to: 'to_example', # String | The End Date in format yyyy-mm-dd
  timesheet_approval_input: OpenapiClient::TimesheetApprovalInput.new # TimesheetApprovalInput | 
}

begin
  # Submit Timesheet
  result = api_instance.submit_timesheet_for_user(account_id, from, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->submit_timesheet_for_user: #{e}"
end
```

#### Using the submit_timesheet_for_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TimesheetApproval>, Integer, Hash)> submit_timesheet_for_user_with_http_info(account_id, from, opts)

```ruby
begin
  # Submit Timesheet
  data, status_code, headers = api_instance.submit_timesheet_for_user_with_http_info(account_id, from, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TimesheetApproval>
rescue OpenapiClient::ApiError => e
  puts "Error when calling TimesheetApprovalsApi->submit_timesheet_for_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **from** | **String** | The Start Date in format yyyy-mm-dd |  |
| **to** | **String** | The End Date in format yyyy-mm-dd | [optional] |
| **timesheet_approval_input** | [**TimesheetApprovalInput**](TimesheetApprovalInput.md) |  | [optional] |

### Return type

[**TimesheetApproval**](TimesheetApproval.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

