# OpenapiClient::WorkAttribute

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | **String** | The key of the &#x60;WorkAttribute&#x60; |  |
| **name** | **String** | The name of the &#x60;WorkAttribute&#x60; |  |
| **names** | **Hash&lt;String, String&gt;** | Only relevant when type is &#x60;STATIC_LIST&#x60;. Each &#x60;STATIC_LIST&#x60; entry has an immutable &#x60;value&#x60; which is stored with the worklog, and a &#x60;name&#x60; that is shown in the UI. The &#x60;name&#x60; can be changed. | [optional] |
| **required** | **Boolean** | Whether this &#x60;WorkAttribute&#x60; is required |  |
| **_self** | **String** | A permanent link to this resource |  |
| **type** | **String** | The type of the &#x60;WorkAttribute&#x60; |  |
| **values** | **Array&lt;String&gt;** | Only relevant when type is &#x60;STATIC_LIST&#x60;. These values are immutable. Their UI representation can be looked up in the &#x60;names&#x60; object below | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::WorkAttribute.new(
  key: _Attr_1_,
  name: Attr 1,
  names: {&quot;SomeValue&quot;:&quot;Some Value&quot;},
  required: false,
  _self: https://api.tempo.io/[...],
  type: STATIC_LIST,
  values: [&quot;Some Value&quot;]
)
```

