# OpenapiClient::GlobalConfigurationsApi

All URIs are relative to *https://api.tempo.io/4*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_global_configuration**](GlobalConfigurationsApi.md#get_global_configuration) | **GET** /globalconfiguration | Retrieve Global Configurations |


## get_global_configuration

> <GlobalConfiguration> get_global_configuration

Retrieve Global Configurations

Retrieves the Global Configurations

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::GlobalConfigurationsApi.new

begin
  # Retrieve Global Configurations
  result = api_instance.get_global_configuration
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GlobalConfigurationsApi->get_global_configuration: #{e}"
end
```

#### Using the get_global_configuration_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GlobalConfiguration>, Integer, Hash)> get_global_configuration_with_http_info

```ruby
begin
  # Retrieve Global Configurations
  data, status_code, headers = api_instance.get_global_configuration_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GlobalConfiguration>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GlobalConfigurationsApi->get_global_configuration_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GlobalConfiguration**](GlobalConfiguration.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

