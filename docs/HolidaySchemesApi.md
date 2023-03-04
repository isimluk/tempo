# OpenapiClient::HolidaySchemesApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_holiday**](HolidaySchemesApi.md#create_holiday) | **POST** /holiday-schemes/{schemeId}/holidays | Add holiday |
| [**create_holiday_scheme**](HolidaySchemesApi.md#create_holiday_scheme) | **POST** /holiday-schemes | Add holiday scheme |
| [**delete_holiday**](HolidaySchemesApi.md#delete_holiday) | **DELETE** /holiday-schemes/{schemeId}/holidays/{holidayId} | Delete holiday |
| [**delete_holiday_scheme**](HolidaySchemesApi.md#delete_holiday_scheme) | **DELETE** /holiday-schemes/{schemeId} | Delete a holiday scheme |
| [**get_floating_holidays**](HolidaySchemesApi.md#get_floating_holidays) | **GET** /holiday-schemes/{schemeId}/holidays/floating | Get floating holidays |
| [**get_holiday**](HolidaySchemesApi.md#get_holiday) | **GET** /holiday-schemes/{schemeId}/holidays/{holidayId} | Get holiday |
| [**get_holiday_scheme**](HolidaySchemesApi.md#get_holiday_scheme) | **GET** /holiday-schemes/{schemeId} | Get holiday scheme |
| [**get_holiday_schemes**](HolidaySchemesApi.md#get_holiday_schemes) | **GET** /holiday-schemes | Get holiday schemes |
| [**get_holidays**](HolidaySchemesApi.md#get_holidays) | **GET** /holiday-schemes/{schemeId}/holidays | Get holidays |
| [**get_user_holiday_scheme**](HolidaySchemesApi.md#get_user_holiday_scheme) | **GET** /holiday-schemes/users/{accountId} | Get user scheme |
| [**get_workload_scheme_members**](HolidaySchemesApi.md#get_workload_scheme_members) | **GET** /holiday-schemes/{schemeId}/members | Get members in a holiday scheme |
| [**set_default_scheme**](HolidaySchemesApi.md#set_default_scheme) | **PUT** /holiday-schemes/{schemeId}/default | Set the default holiday scheme |
| [**set_workload_scheme_membership**](HolidaySchemesApi.md#set_workload_scheme_membership) | **POST** /holiday-schemes/{schemeId}/members | Set holiday scheme to members |
| [**update_holiday**](HolidaySchemesApi.md#update_holiday) | **PUT** /holiday-schemes/{schemeId}/holidays/{holidayId} | Update a holiday |
| [**update_holiday_scheme**](HolidaySchemesApi.md#update_holiday_scheme) | **PUT** /holiday-schemes/{schemeId} | Update a holiday scheme |


## create_holiday

> <Holiday> create_holiday(scheme_id, opts)

Add holiday

Add a holiday using the provided input

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
scheme_id = 'scheme_id_example' # String | The id of the Scheme
opts = {
  holiday_input: OpenapiClient::HolidayInput.new({date: Date.today, duration_seconds: 18000, name: 'National Holiday', type: 'FIXED'}) # HolidayInput | 
}

begin
  # Add holiday
  result = api_instance.create_holiday(scheme_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->create_holiday: #{e}"
end
```

#### Using the create_holiday_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Holiday>, Integer, Hash)> create_holiday_with_http_info(scheme_id, opts)

```ruby
begin
  # Add holiday
  data, status_code, headers = api_instance.create_holiday_with_http_info(scheme_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Holiday>
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->create_holiday_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scheme_id** | **String** | The id of the Scheme |  |
| **holiday_input** | [**HolidayInput**](HolidayInput.md) |  | [optional] |

### Return type

[**Holiday**](Holiday.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_holiday_scheme

> <HolidayScheme> create_holiday_scheme(opts)

Add holiday scheme

Add holiday scheme of a given input

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
opts = {
  holiday_scheme_input_bean: OpenapiClient::HolidaySchemeInputBean.new({name: 'Default Holiday Scheme'}) # HolidaySchemeInputBean | 
}

begin
  # Add holiday scheme
  result = api_instance.create_holiday_scheme(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->create_holiday_scheme: #{e}"
end
```

#### Using the create_holiday_scheme_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<HolidayScheme>, Integer, Hash)> create_holiday_scheme_with_http_info(opts)

```ruby
begin
  # Add holiday scheme
  data, status_code, headers = api_instance.create_holiday_scheme_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <HolidayScheme>
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->create_holiday_scheme_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **holiday_scheme_input_bean** | [**HolidaySchemeInputBean**](HolidaySchemeInputBean.md) |  | [optional] |

### Return type

[**HolidayScheme**](HolidayScheme.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_holiday

> delete_holiday(scheme_id, holiday_id)

Delete holiday

Delete a holiday with the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
scheme_id = 'scheme_id_example' # String | The id of the Scheme
holiday_id = 'holiday_id_example' # String | The id of the holiday

begin
  # Delete holiday
  api_instance.delete_holiday(scheme_id, holiday_id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->delete_holiday: #{e}"
end
```

#### Using the delete_holiday_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_holiday_with_http_info(scheme_id, holiday_id)

```ruby
begin
  # Delete holiday
  data, status_code, headers = api_instance.delete_holiday_with_http_info(scheme_id, holiday_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->delete_holiday_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scheme_id** | **String** | The id of the Scheme |  |
| **holiday_id** | **String** | The id of the holiday |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_holiday_scheme

> delete_holiday_scheme(scheme_id)

Delete a holiday scheme

Delete a holiday scheme with the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
scheme_id = 'scheme_id_example' # String | The id of the Scheme

begin
  # Delete a holiday scheme
  api_instance.delete_holiday_scheme(scheme_id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->delete_holiday_scheme: #{e}"
end
```

#### Using the delete_holiday_scheme_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_holiday_scheme_with_http_info(scheme_id)

```ruby
begin
  # Delete a holiday scheme
  data, status_code, headers = api_instance.delete_holiday_scheme_with_http_info(scheme_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->delete_holiday_scheme_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scheme_id** | **String** | The id of the Scheme |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_floating_holidays

> <HolidayResults> get_floating_holidays(scheme_id)

Get floating holidays

List all floating holidays of a given scheme

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
scheme_id = 'scheme_id_example' # String | The id of the Scheme

begin
  # Get floating holidays
  result = api_instance.get_floating_holidays(scheme_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_floating_holidays: #{e}"
end
```

#### Using the get_floating_holidays_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<HolidayResults>, Integer, Hash)> get_floating_holidays_with_http_info(scheme_id)

```ruby
begin
  # Get floating holidays
  data, status_code, headers = api_instance.get_floating_holidays_with_http_info(scheme_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <HolidayResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_floating_holidays_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scheme_id** | **String** | The id of the Scheme |  |

### Return type

[**HolidayResults**](HolidayResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_holiday

> <Holiday> get_holiday(scheme_id, holiday_id)

Get holiday

Get holiday information

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
scheme_id = 'scheme_id_example' # String | The id of the holiday scheme
holiday_id = 'holiday_id_example' # String | The id of the holiday

begin
  # Get holiday
  result = api_instance.get_holiday(scheme_id, holiday_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_holiday: #{e}"
end
```

#### Using the get_holiday_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Holiday>, Integer, Hash)> get_holiday_with_http_info(scheme_id, holiday_id)

```ruby
begin
  # Get holiday
  data, status_code, headers = api_instance.get_holiday_with_http_info(scheme_id, holiday_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Holiday>
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_holiday_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scheme_id** | **String** | The id of the holiday scheme |  |
| **holiday_id** | **String** | The id of the holiday |  |

### Return type

[**Holiday**](Holiday.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_holiday_scheme

> <HolidayScheme> get_holiday_scheme(scheme_id)

Get holiday scheme

Get Holiday scheme of a given scheme id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
scheme_id = 'scheme_id_example' # String | The id of the Scheme

begin
  # Get holiday scheme
  result = api_instance.get_holiday_scheme(scheme_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_holiday_scheme: #{e}"
end
```

#### Using the get_holiday_scheme_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<HolidayScheme>, Integer, Hash)> get_holiday_scheme_with_http_info(scheme_id)

```ruby
begin
  # Get holiday scheme
  data, status_code, headers = api_instance.get_holiday_scheme_with_http_info(scheme_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <HolidayScheme>
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_holiday_scheme_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scheme_id** | **String** | The id of the Scheme |  |

### Return type

[**HolidayScheme**](HolidayScheme.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_holiday_schemes

> <HolidaySchemeResults> get_holiday_schemes

Get holiday schemes

List all holiday schemes

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new

begin
  # Get holiday schemes
  result = api_instance.get_holiday_schemes
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_holiday_schemes: #{e}"
end
```

#### Using the get_holiday_schemes_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<HolidaySchemeResults>, Integer, Hash)> get_holiday_schemes_with_http_info

```ruby
begin
  # Get holiday schemes
  data, status_code, headers = api_instance.get_holiday_schemes_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <HolidaySchemeResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_holiday_schemes_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**HolidaySchemeResults**](HolidaySchemeResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_holidays

> <HolidayResults> get_holidays(scheme_id, opts)

Get holidays

List all holidays of a given scheme and year

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
scheme_id = 'scheme_id_example' # String | The id of the Scheme
opts = {
  year: 56 # Integer | Year for holidays to be retrieved for. Returns holidays for current year if omitted.
}

begin
  # Get holidays
  result = api_instance.get_holidays(scheme_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_holidays: #{e}"
end
```

#### Using the get_holidays_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<HolidayResults>, Integer, Hash)> get_holidays_with_http_info(scheme_id, opts)

```ruby
begin
  # Get holidays
  data, status_code, headers = api_instance.get_holidays_with_http_info(scheme_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <HolidayResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_holidays_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scheme_id** | **String** | The id of the Scheme |  |
| **year** | **Integer** | Year for holidays to be retrieved for. Returns holidays for current year if omitted. | [optional] |

### Return type

[**HolidayResults**](HolidayResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_user_holiday_scheme

> <HolidayScheme> get_user_holiday_scheme(account_id)

Get user scheme

Get an user scheme with the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
account_id = 'account_id_example' # String | A unique identifier of the user in Jira

begin
  # Get user scheme
  result = api_instance.get_user_holiday_scheme(account_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_user_holiday_scheme: #{e}"
end
```

#### Using the get_user_holiday_scheme_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<HolidayScheme>, Integer, Hash)> get_user_holiday_scheme_with_http_info(account_id)

```ruby
begin
  # Get user scheme
  data, status_code, headers = api_instance.get_user_holiday_scheme_with_http_info(account_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <HolidayScheme>
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_user_holiday_scheme_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | A unique identifier of the user in Jira |  |

### Return type

[**HolidayScheme**](HolidayScheme.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_workload_scheme_members

> <PageableUser> get_workload_scheme_members(scheme_id, opts)

Get members in a holiday scheme

Get holiday scheme members with the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
scheme_id = 'scheme_id_example' # String | The id of the Scheme
opts = {
  offset: 56, # Integer | Skip over a number of elements by specifying an offset value for the query
  limit: 56 # Integer | Limit the number of elements on the response
}

begin
  # Get members in a holiday scheme
  result = api_instance.get_workload_scheme_members(scheme_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_workload_scheme_members: #{e}"
end
```

#### Using the get_workload_scheme_members_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageableUser>, Integer, Hash)> get_workload_scheme_members_with_http_info(scheme_id, opts)

```ruby
begin
  # Get members in a holiday scheme
  data, status_code, headers = api_instance.get_workload_scheme_members_with_http_info(scheme_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageableUser>
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->get_workload_scheme_members_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scheme_id** | **String** | The id of the Scheme |  |
| **offset** | **Integer** | Skip over a number of elements by specifying an offset value for the query | [optional][default to 0] |
| **limit** | **Integer** | Limit the number of elements on the response | [optional][default to 50] |

### Return type

[**PageableUser**](PageableUser.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## set_default_scheme

> <HolidayScheme> set_default_scheme(scheme_id)

Set the default holiday scheme

Set the default holiday scheme

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
scheme_id = 'scheme_id_example' # String | The id of the Scheme

begin
  # Set the default holiday scheme
  result = api_instance.set_default_scheme(scheme_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->set_default_scheme: #{e}"
end
```

#### Using the set_default_scheme_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<HolidayScheme>, Integer, Hash)> set_default_scheme_with_http_info(scheme_id)

```ruby
begin
  # Set the default holiday scheme
  data, status_code, headers = api_instance.set_default_scheme_with_http_info(scheme_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <HolidayScheme>
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->set_default_scheme_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scheme_id** | **String** | The id of the Scheme |  |

### Return type

[**HolidayScheme**](HolidayScheme.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## set_workload_scheme_membership

> set_workload_scheme_membership(scheme_id, opts)

Set holiday scheme to members

Assign a holiday scheme with the given id to members using the provided input

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
scheme_id = 'scheme_id_example' # String | The id of the Scheme
opts = {
  holiday_scheme_members_input: OpenapiClient::HolidaySchemeMembersInput.new # HolidaySchemeMembersInput | 
}

begin
  # Set holiday scheme to members
  api_instance.set_workload_scheme_membership(scheme_id, opts)
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->set_workload_scheme_membership: #{e}"
end
```

#### Using the set_workload_scheme_membership_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> set_workload_scheme_membership_with_http_info(scheme_id, opts)

```ruby
begin
  # Set holiday scheme to members
  data, status_code, headers = api_instance.set_workload_scheme_membership_with_http_info(scheme_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->set_workload_scheme_membership_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scheme_id** | **String** | The id of the Scheme |  |
| **holiday_scheme_members_input** | [**HolidaySchemeMembersInput**](HolidaySchemeMembersInput.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## update_holiday

> <Holiday> update_holiday(scheme_id, holiday_id, opts)

Update a holiday

Update a holiday with the given id using the provided input

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
scheme_id = 'scheme_id_example' # String | The id of the Scheme
holiday_id = 'holiday_id_example' # String | The id of the holiday
opts = {
  holiday_input: OpenapiClient::HolidayInput.new({date: Date.today, duration_seconds: 18000, name: 'National Holiday', type: 'FIXED'}) # HolidayInput | 
}

begin
  # Update a holiday
  result = api_instance.update_holiday(scheme_id, holiday_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->update_holiday: #{e}"
end
```

#### Using the update_holiday_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Holiday>, Integer, Hash)> update_holiday_with_http_info(scheme_id, holiday_id, opts)

```ruby
begin
  # Update a holiday
  data, status_code, headers = api_instance.update_holiday_with_http_info(scheme_id, holiday_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Holiday>
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->update_holiday_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scheme_id** | **String** | The id of the Scheme |  |
| **holiday_id** | **String** | The id of the holiday |  |
| **holiday_input** | [**HolidayInput**](HolidayInput.md) |  | [optional] |

### Return type

[**Holiday**](Holiday.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_holiday_scheme

> <HolidayScheme> update_holiday_scheme(scheme_id, opts)

Update a holiday scheme

Update a holiday scheme with the given id using the provided input

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::HolidaySchemesApi.new
scheme_id = 'scheme_id_example' # String | The id of the Scheme
opts = {
  holiday_scheme_input_bean: OpenapiClient::HolidaySchemeInputBean.new({name: 'Default Holiday Scheme'}) # HolidaySchemeInputBean | 
}

begin
  # Update a holiday scheme
  result = api_instance.update_holiday_scheme(scheme_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->update_holiday_scheme: #{e}"
end
```

#### Using the update_holiday_scheme_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<HolidayScheme>, Integer, Hash)> update_holiday_scheme_with_http_info(scheme_id, opts)

```ruby
begin
  # Update a holiday scheme
  data, status_code, headers = api_instance.update_holiday_scheme_with_http_info(scheme_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <HolidayScheme>
rescue OpenapiClient::ApiError => e
  puts "Error when calling HolidaySchemesApi->update_holiday_scheme_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scheme_id** | **String** | The id of the Scheme |  |
| **holiday_scheme_input_bean** | [**HolidaySchemeInputBean**](HolidaySchemeInputBean.md) |  | [optional] |

### Return type

[**HolidayScheme**](HolidayScheme.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

