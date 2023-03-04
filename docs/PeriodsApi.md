# OpenapiClient::PeriodsApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_periods**](PeriodsApi.md#get_periods) | **GET** /periods | Retrieve Periods |


## get_periods

> <TimesheetApprovalPeriodsBean> get_periods(from, to)

Retrieve Periods

Retrieves a list of all Periods for the given date range

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PeriodsApi.new
from = 'from_example' # String | The start date in format yyyy-mm-dd
to = 'to_example' # String | The end date in format yyyy-mm-dd

begin
  # Retrieve Periods
  result = api_instance.get_periods(from, to)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PeriodsApi->get_periods: #{e}"
end
```

#### Using the get_periods_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TimesheetApprovalPeriodsBean>, Integer, Hash)> get_periods_with_http_info(from, to)

```ruby
begin
  # Retrieve Periods
  data, status_code, headers = api_instance.get_periods_with_http_info(from, to)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TimesheetApprovalPeriodsBean>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PeriodsApi->get_periods_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **from** | **String** | The start date in format yyyy-mm-dd |  |
| **to** | **String** | The end date in format yyyy-mm-dd |  |

### Return type

[**TimesheetApprovalPeriodsBean**](TimesheetApprovalPeriodsBean.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

