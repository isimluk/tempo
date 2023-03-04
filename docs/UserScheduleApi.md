# OpenapiClient::UserScheduleApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_authenticated_user_schedule**](UserScheduleApi.md#get_authenticated_user_schedule) | **GET** /user-schedule | Retrieve logged User Schedule |
| [**get_user_schedule**](UserScheduleApi.md#get_user_schedule) | **GET** /user-schedule/{accountId} | Retrieve User Schedule |


## get_authenticated_user_schedule

> <DayScheduleResults> get_authenticated_user_schedule(from, to)

Retrieve logged User Schedule

Retrieves the Schedule of the logged-in User

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::UserScheduleApi.new
from = 'from_example' # String | The start date in format yyyy-mm-dd
to = 'to_example' # String | The end date in format yyyy-mm-dd

begin
  # Retrieve logged User Schedule
  result = api_instance.get_authenticated_user_schedule(from, to)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UserScheduleApi->get_authenticated_user_schedule: #{e}"
end
```

#### Using the get_authenticated_user_schedule_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DayScheduleResults>, Integer, Hash)> get_authenticated_user_schedule_with_http_info(from, to)

```ruby
begin
  # Retrieve logged User Schedule
  data, status_code, headers = api_instance.get_authenticated_user_schedule_with_http_info(from, to)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DayScheduleResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UserScheduleApi->get_authenticated_user_schedule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **from** | **String** | The start date in format yyyy-mm-dd |  |
| **to** | **String** | The end date in format yyyy-mm-dd |  |

### Return type

[**DayScheduleResults**](DayScheduleResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_user_schedule

> <DayScheduleResults> get_user_schedule(account_id, from, to)

Retrieve User Schedule

Retrieves Schedule for the given User

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::UserScheduleApi.new
account_id = 'account_id_example' # String | 
from = 'from_example' # String | The start date in format yyyy-mm-dd
to = 'to_example' # String | The end date in format yyyy-mm-dd

begin
  # Retrieve User Schedule
  result = api_instance.get_user_schedule(account_id, from, to)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UserScheduleApi->get_user_schedule: #{e}"
end
```

#### Using the get_user_schedule_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DayScheduleResults>, Integer, Hash)> get_user_schedule_with_http_info(account_id, from, to)

```ruby
begin
  # Retrieve User Schedule
  data, status_code, headers = api_instance.get_user_schedule_with_http_info(account_id, from, to)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DayScheduleResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UserScheduleApi->get_user_schedule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **from** | **String** | The start date in format yyyy-mm-dd |  |
| **to** | **String** | The end date in format yyyy-mm-dd |  |

### Return type

[**DayScheduleResults**](DayScheduleResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

