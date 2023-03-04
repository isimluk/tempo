# OpenapiClient::PlansApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_plan**](PlansApi.md#create_plan) | **POST** /plans | Create Plan |
| [**delete_plan_by_id**](PlansApi.md#delete_plan_by_id) | **DELETE** /plans/{id} | Delete Plan |
| [**get_plan_by_id**](PlansApi.md#get_plan_by_id) | **GET** /plans/{id} | Retrieve Plan |
| [**get_plans**](PlansApi.md#get_plans) | **POST** /plans/search | Search Plans |
| [**get_plans_for_generic_resource**](PlansApi.md#get_plans_for_generic_resource) | **GET** /plans/generic-resource/{genericResourceId} | Retrieve Plans for Generic Resource |
| [**get_plans_for_user**](PlansApi.md#get_plans_for_user) | **GET** /plans/user/{accountId} | Retrieve Plans for User |
| [**update_plan**](PlansApi.md#update_plan) | **PUT** /plans/{id} | Update Plan |


## create_plan

> <Plan> create_plan(opts)

Create Plan

Creates a new Plan using the provided input and returns the newly created Plan

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PlansApi.new
opts = {
  plan_input: OpenapiClient::PlanInput.new({assignee_id: '123456:01234567-89ab-cdef-0123-456789abcdef', assignee_type: 'USER', end_date: '2022-05-17', plan_item_id: '598', plan_item_type: 'ISSUE', planned_seconds_per_day: 28800, start_date: '2022-05-17'}) # PlanInput | 
}

begin
  # Create Plan
  result = api_instance.create_plan(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->create_plan: #{e}"
end
```

#### Using the create_plan_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Plan>, Integer, Hash)> create_plan_with_http_info(opts)

```ruby
begin
  # Create Plan
  data, status_code, headers = api_instance.create_plan_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Plan>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->create_plan_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **plan_input** | [**PlanInput**](PlanInput.md) |  | [optional] |

### Return type

[**Plan**](Plan.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_plan_by_id

> delete_plan_by_id(id)

Delete Plan

Deletes an existing Plan for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PlansApi.new
id = 56 # Integer | An id that uniquely identifies the Plan

begin
  # Delete Plan
  api_instance.delete_plan_by_id(id)
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->delete_plan_by_id: #{e}"
end
```

#### Using the delete_plan_by_id_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_plan_by_id_with_http_info(id)

```ruby
begin
  # Delete Plan
  data, status_code, headers = api_instance.delete_plan_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->delete_plan_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An id that uniquely identifies the Plan |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_plan_by_id

> <Plan> get_plan_by_id(id)

Retrieve Plan

Retrieves an existing Plan for the given id

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PlansApi.new
id = 56 # Integer | An id that uniquely identifies the Plan

begin
  # Retrieve Plan
  result = api_instance.get_plan_by_id(id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->get_plan_by_id: #{e}"
end
```

#### Using the get_plan_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Plan>, Integer, Hash)> get_plan_by_id_with_http_info(id)

```ruby
begin
  # Retrieve Plan
  data, status_code, headers = api_instance.get_plan_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Plan>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->get_plan_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An id that uniquely identifies the Plan |  |

### Return type

[**Plan**](Plan.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_plans

> <PageablePlanWithoutSelfLink> get_plans(opts)

Search Plans

Retrieves a list of existing Plans that matches the given search parameters

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PlansApi.new
opts = {
  plan_search_input: OpenapiClient::PlanSearchInput.new({from: '2022-05-17', to: '2022-05-17'}) # PlanSearchInput | 
}

begin
  # Search Plans
  result = api_instance.get_plans(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->get_plans: #{e}"
end
```

#### Using the get_plans_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PageablePlanWithoutSelfLink>, Integer, Hash)> get_plans_with_http_info(opts)

```ruby
begin
  # Search Plans
  data, status_code, headers = api_instance.get_plans_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PageablePlanWithoutSelfLink>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->get_plans_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **plan_search_input** | [**PlanSearchInput**](PlanSearchInput.md) |  | [optional] |

### Return type

[**PageablePlanWithoutSelfLink**](PageablePlanWithoutSelfLink.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_plans_for_generic_resource

> <PlanResults> get_plans_for_generic_resource(generic_resource_id, opts)

Retrieve Plans for Generic Resource

Retrieves a list of existing Plans for the given Generic Resource

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PlansApi.new
generic_resource_id = 56 # Integer | Id of the generic resource you want to search plans for
opts = {
  planned_time_breakdown: ['inner_example'], # Array<String> | Defines how detailed you would like to see the breakdown of the planned time for each plan.You can add one or both of these values as query params [DAILY, PERIOD] to see more detailed breakdown of planned time.
  from: 'from_example', # String | Retrieve plans starting with this date
  to: 'to_example', # String | Retrieve plans that ends up to and including this date
  updated_from: 'updated_from_example' # String | Retrieve plans that have been updated from this date
}

begin
  # Retrieve Plans for Generic Resource
  result = api_instance.get_plans_for_generic_resource(generic_resource_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->get_plans_for_generic_resource: #{e}"
end
```

#### Using the get_plans_for_generic_resource_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PlanResults>, Integer, Hash)> get_plans_for_generic_resource_with_http_info(generic_resource_id, opts)

```ruby
begin
  # Retrieve Plans for Generic Resource
  data, status_code, headers = api_instance.get_plans_for_generic_resource_with_http_info(generic_resource_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PlanResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->get_plans_for_generic_resource_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **generic_resource_id** | **Integer** | Id of the generic resource you want to search plans for |  |
| **planned_time_breakdown** | [**Array&lt;String&gt;**](String.md) | Defines how detailed you would like to see the breakdown of the planned time for each plan.You can add one or both of these values as query params [DAILY, PERIOD] to see more detailed breakdown of planned time. | [optional] |
| **from** | **String** | Retrieve plans starting with this date | [optional] |
| **to** | **String** | Retrieve plans that ends up to and including this date | [optional] |
| **updated_from** | **String** | Retrieve plans that have been updated from this date | [optional] |

### Return type

[**PlanResults**](PlanResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_plans_for_user

> <PlanResults> get_plans_for_user(account_id, opts)

Retrieve Plans for User

Retrieves a list of Plans for the given User

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PlansApi.new
account_id = 'account_id_example' # String | Id of the user you want to search plans for
opts = {
  planned_time_breakdown: ['inner_example'], # Array<String> | Defines how detailed you would like to see the breakdown of the planned time for each plan.You can add one or both of these values as query params [DAILY, PERIOD] to see more detailed breakdown of planned time.
  from: 'from_example', # String | Retrieve plans starting with this date
  to: 'to_example', # String | Retrieve plans that ends up to and including this date
  updated_from: 'updated_from_example' # String | Retrieve plans that have been updated from this date
}

begin
  # Retrieve Plans for User
  result = api_instance.get_plans_for_user(account_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->get_plans_for_user: #{e}"
end
```

#### Using the get_plans_for_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PlanResults>, Integer, Hash)> get_plans_for_user_with_http_info(account_id, opts)

```ruby
begin
  # Retrieve Plans for User
  data, status_code, headers = api_instance.get_plans_for_user_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PlanResults>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->get_plans_for_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Id of the user you want to search plans for |  |
| **planned_time_breakdown** | [**Array&lt;String&gt;**](String.md) | Defines how detailed you would like to see the breakdown of the planned time for each plan.You can add one or both of these values as query params [DAILY, PERIOD] to see more detailed breakdown of planned time. | [optional] |
| **from** | **String** | Retrieve plans starting with this date | [optional] |
| **to** | **String** | Retrieve plans that ends up to and including this date | [optional] |
| **updated_from** | **String** | Retrieve plans that have been updated from this date | [optional] |

### Return type

[**PlanResults**](PlanResults.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_plan

> <Plan> update_plan(id, opts)

Update Plan

Updates an existing Plan for the given id using the provided input and returns the updated Plan

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::PlansApi.new
id = 56 # Integer | An id that uniquely identifies the Plan
opts = {
  plan_input: OpenapiClient::PlanInput.new({assignee_id: '123456:01234567-89ab-cdef-0123-456789abcdef', assignee_type: 'USER', end_date: '2022-05-17', plan_item_id: '598', plan_item_type: 'ISSUE', planned_seconds_per_day: 28800, start_date: '2022-05-17'}) # PlanInput | 
}

begin
  # Update Plan
  result = api_instance.update_plan(id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->update_plan: #{e}"
end
```

#### Using the update_plan_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Plan>, Integer, Hash)> update_plan_with_http_info(id, opts)

```ruby
begin
  # Update Plan
  data, status_code, headers = api_instance.update_plan_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Plan>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PlansApi->update_plan_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | An id that uniquely identifies the Plan |  |
| **plan_input** | [**PlanInput**](PlanInput.md) |  | [optional] |

### Return type

[**Plan**](Plan.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

