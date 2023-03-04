=begin
#REST API documentation

#<p>Base Path: https://api.tempo.io/4</p> <div style=\"background-color: #E5F9FD;padding: 15px;margin: 20px 0;\">   This documentation is for <strong>version 4</strong> of the Tempo REST API, which is the latest version. To read documentation for version 3 of the Tempo REST API, <a href=\"https://apidocs.tempo.io/v3\"><strong>click here</strong></a>  </div>  We encourage you to join our developer community on Slack at [www.tempo.io/developers](https://www.tempo.io/developers), where you can get support from our internal experts and share best practices with other developers building with Tempo.  If you have feedback or requests, you can also reach us through our Customer Support Portal. You can find general product  information in the Tempo Help Center.  Below are links to other Tempo APIs. <ul>   <li><a href=\"https://apidocs.tempo.io/audit\">Audit API</a></li>   <li><a href=\"https://apidocs.tempo.io/cost-tracker\">Cost-Tracker API</a></li>   <li><a href=\"https://apidocs.tempo.io/jira\">Jira Links API</a></li> </ul>  ## Authentication ### Using the REST API as an individual user  You can use the REST API to interact with the data your permissions give you access to. To do so, you will need to  generate a Tempo OAuth 2.0 token.  Go to **Tempo>Settings**, scroll down to **Data Access** and select **API integration**.  Once you have a token, you need to use it inside the Authorization HTTP header. Ex:  `curl -v -H \"Authorization: Bearer $token\" \"https://api.tempo.io/4/worklogs?...\"`<br><br>  ### Using the REST API as an application developer  If you are building apps with Tempo, and have the required Tempo administrator permissions, you can quickly  obtain the OAuth 2.0 credentials you need to retrieve an access token. Access tokens grant temporary, secure  access to Tempo, based on your current permissions.  #### Obtain your credentials  Go to **Tempo>Settings**, scroll down to **Data Access** and select **OAuth 2.0 authentication**.  Enter a Redirect URI and specify the Client type and Authorization grant type. In most cases you will choose Authorization code as the Authorization grant type.  Once you click **Add**, your Client ID and Client secret are generated and you can retrieve your access token.<br><br>  ### How to retrieve an access token for a user #### Authorization grant type used is *authorization_code* ##### Step 1 Obtain an authorization code against your Jira Cloud instance :  `GET: https://{jira-cloud-instance-name}.atlassian.net/plugins/servlet/ac/io.tempo.jira/oauth-authorize/?client_id=$CLIENT_ID&redirect_uri=$REDIRECT_URI`  Where *$CLIENT_ID* and *$REDIRECT_URI* match the one you generated in **Tempo > Settings > OAuth 2.0 Applications**  You will be asked to *authorize* or *deny* access to your Tempo data. Granting access redirects you to the configured  *redirect URI* with a new query string parameter named *code* (this is the authorization code). Note that this authorization code  expires quickly.  ![MyApp Request Access](myapp-request-access.png \"MyApp Request Access\")  ##### Step 2 Obtain an access token from Tempo by providing the *authorization code* to:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"authorization_code\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI code = $CODE ```  The response includes the access token itself, related information, and a refresh token. ```JSON {   \"access_token\":\"$ACCESS_TOKEN\",   \"expires_in\":5184000,   \"token_type\":\"Bearer\",   \"scope\":\"read write\",   \"refresh_token\":\"$REFRESH_TOKEN\" } ```  ##### Step 3 Provide this *access token* to any API requests using the *Authorization header* :  `curl -H \"Authorization: Bearer $ACCESS_TOKEN\" \"https://api.tempo.io/4/worklogs?from=2022-01-28&to=2022-02-03\"`  The access token will expire after the number of seconds specified in the **expires_in** field and will  no longer be usable.  ### How to retrieve a new access token from the refresh token The *access token* will eventually expire. You need to renew it using the previously received *refresh token*:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"refresh_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI refresh_token = $REFRESH_TOKEN ```  The response will contain a new *access token* and a new *refresh token*. You'll need to utilize these  new tokens for future calls, as the previous ones will no longer be valid.  ### How to revoke a token You can revoke an existing *access token* at any time:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` token_type_hint = \"access_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET token = $ACCESS_TOKEN ```  You can also revoke an existing *refresh token*:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` {   token_type_hint = \"refresh_token\"   client_id = $CLIENT_ID   client_secret = $CLIENT_SECRET   token = $REFRESH_TOKEN } ```  ## API conventions ### Identifying users The Tempo REST API uses the Atlassian accountId to identify users. The accountId is an opaque identifier that  uniquely identifies the user.  The accountId of the current user can found using the [Jira Myself API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-Myself).  Information about a user, given the accountId, can be retrieved using the [Jira User API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-User).  ### Dates The API uses strings to represent dates. Dates are formatted as [ISO 8601 calendar dates](https://en.wikipedia.org/wiki/ISO_8601#Calendar_dates) (YYYY-MM-DD).  For example, March 29th, 2019 is formatted as 2019-03-29.  ### Delete requests On success, delete requests return a response with status code [204 (No content)](https://httpstatuses.com/204).  No payload body is included in the response.  ### Arrays A few endpoints accept query parameters of type array. That is achieved by repeating the parameter multiple  times, e.g. to get worklogs from three projects:  `.../worklogs?from=2020-01-01&to=2020-12-31&project=10100&project=10200&project=10300`  ## Errors  The API uses standard HTTP status codes to indicate the success or failure of the API call.  Here are a list of different types of error responses  Status code  | Description | Content type ----------------|-------------|--------- 400 | Bad Request | application/json 401 | Unauthorized | text/html 403 | Forbidden | text/html 404 | Not Found | application/json  <br>  The body of the JSON response will be in the following format:  ``` {   \"errors\": {     \"message\": \"Error details\"   } } ```  An example of 400 error ```   {     \"errors\": {       \"message\": \"'date' must be valid on the format: 'yyyy-MM-dd'\"     }   } ```  An example of 404 error ```   {     \"errors\": {       \"message\": \"Account 'xyz' not found\"     }   } ``` 

The version of the OpenAPI document: 4.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.5.0-SNAPSHOT

=end

require 'cgi'

module OpenapiClient
  class PlansApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Plan
    # Creates a new Plan using the provided input and returns the newly created Plan
    # @param [Hash] opts the optional parameters
    # @option opts [PlanInput] :plan_input 
    # @return [Plan]
    def create_plan(opts = {})
      data, _status_code, _headers = create_plan_with_http_info(opts)
      data
    end

    # Create Plan
    # Creates a new Plan using the provided input and returns the newly created Plan
    # @param [Hash] opts the optional parameters
    # @option opts [PlanInput] :plan_input 
    # @return [Array<(Plan, Integer, Hash)>] Plan data, response status code and response headers
    def create_plan_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PlansApi.create_plan ...'
      end
      # resource path
      local_var_path = '/plans'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'plan_input'])

      # return_type
      return_type = opts[:debug_return_type] || 'Plan'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"PlansApi.create_plan",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PlansApi#create_plan\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Plan
    # Deletes an existing Plan for the given id
    # @param id [Integer] An id that uniquely identifies the Plan
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_plan_by_id(id, opts = {})
      delete_plan_by_id_with_http_info(id, opts)
      nil
    end

    # Delete Plan
    # Deletes an existing Plan for the given id
    # @param id [Integer] An id that uniquely identifies the Plan
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_plan_by_id_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PlansApi.delete_plan_by_id ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling PlansApi.delete_plan_by_id"
      end
      # resource path
      local_var_path = '/plans/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"PlansApi.delete_plan_by_id",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PlansApi#delete_plan_by_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve Plan
    # Retrieves an existing Plan for the given id
    # @param id [Integer] An id that uniquely identifies the Plan
    # @param [Hash] opts the optional parameters
    # @return [Plan]
    def get_plan_by_id(id, opts = {})
      data, _status_code, _headers = get_plan_by_id_with_http_info(id, opts)
      data
    end

    # Retrieve Plan
    # Retrieves an existing Plan for the given id
    # @param id [Integer] An id that uniquely identifies the Plan
    # @param [Hash] opts the optional parameters
    # @return [Array<(Plan, Integer, Hash)>] Plan data, response status code and response headers
    def get_plan_by_id_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PlansApi.get_plan_by_id ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling PlansApi.get_plan_by_id"
      end
      # resource path
      local_var_path = '/plans/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Plan'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"PlansApi.get_plan_by_id",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PlansApi#get_plan_by_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Search Plans
    # Retrieves a list of existing Plans that matches the given search parameters
    # @param [Hash] opts the optional parameters
    # @option opts [PlanSearchInput] :plan_search_input 
    # @return [PageablePlanWithoutSelfLink]
    def get_plans(opts = {})
      data, _status_code, _headers = get_plans_with_http_info(opts)
      data
    end

    # Search Plans
    # Retrieves a list of existing Plans that matches the given search parameters
    # @param [Hash] opts the optional parameters
    # @option opts [PlanSearchInput] :plan_search_input 
    # @return [Array<(PageablePlanWithoutSelfLink, Integer, Hash)>] PageablePlanWithoutSelfLink data, response status code and response headers
    def get_plans_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PlansApi.get_plans ...'
      end
      # resource path
      local_var_path = '/plans/search'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'plan_search_input'])

      # return_type
      return_type = opts[:debug_return_type] || 'PageablePlanWithoutSelfLink'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"PlansApi.get_plans",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PlansApi#get_plans\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve Plans for Generic Resource
    # Retrieves a list of existing Plans for the given Generic Resource
    # @param generic_resource_id [Integer] Id of the generic resource you want to search plans for
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :planned_time_breakdown Defines how detailed you would like to see the breakdown of the planned time for each plan.You can add one or both of these values as query params [DAILY, PERIOD] to see more detailed breakdown of planned time.
    # @option opts [String] :from Retrieve plans starting with this date
    # @option opts [String] :to Retrieve plans that ends up to and including this date
    # @option opts [String] :updated_from Retrieve plans that have been updated from this date
    # @return [PlanResults]
    def get_plans_for_generic_resource(generic_resource_id, opts = {})
      data, _status_code, _headers = get_plans_for_generic_resource_with_http_info(generic_resource_id, opts)
      data
    end

    # Retrieve Plans for Generic Resource
    # Retrieves a list of existing Plans for the given Generic Resource
    # @param generic_resource_id [Integer] Id of the generic resource you want to search plans for
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :planned_time_breakdown Defines how detailed you would like to see the breakdown of the planned time for each plan.You can add one or both of these values as query params [DAILY, PERIOD] to see more detailed breakdown of planned time.
    # @option opts [String] :from Retrieve plans starting with this date
    # @option opts [String] :to Retrieve plans that ends up to and including this date
    # @option opts [String] :updated_from Retrieve plans that have been updated from this date
    # @return [Array<(PlanResults, Integer, Hash)>] PlanResults data, response status code and response headers
    def get_plans_for_generic_resource_with_http_info(generic_resource_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PlansApi.get_plans_for_generic_resource ...'
      end
      # verify the required parameter 'generic_resource_id' is set
      if @api_client.config.client_side_validation && generic_resource_id.nil?
        fail ArgumentError, "Missing the required parameter 'generic_resource_id' when calling PlansApi.get_plans_for_generic_resource"
      end
      # resource path
      local_var_path = '/plans/generic-resource/{genericResourceId}'.sub('{' + 'genericResourceId' + '}', CGI.escape(generic_resource_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'plannedTimeBreakdown'] = @api_client.build_collection_param(opts[:'planned_time_breakdown'], :multi) if !opts[:'planned_time_breakdown'].nil?
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'to'] = opts[:'to'] if !opts[:'to'].nil?
      query_params[:'updatedFrom'] = opts[:'updated_from'] if !opts[:'updated_from'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'PlanResults'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"PlansApi.get_plans_for_generic_resource",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PlansApi#get_plans_for_generic_resource\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve Plans for User
    # Retrieves a list of Plans for the given User
    # @param account_id [String] Id of the user you want to search plans for
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :planned_time_breakdown Defines how detailed you would like to see the breakdown of the planned time for each plan.You can add one or both of these values as query params [DAILY, PERIOD] to see more detailed breakdown of planned time.
    # @option opts [String] :from Retrieve plans starting with this date
    # @option opts [String] :to Retrieve plans that ends up to and including this date
    # @option opts [String] :updated_from Retrieve plans that have been updated from this date
    # @return [PlanResults]
    def get_plans_for_user(account_id, opts = {})
      data, _status_code, _headers = get_plans_for_user_with_http_info(account_id, opts)
      data
    end

    # Retrieve Plans for User
    # Retrieves a list of Plans for the given User
    # @param account_id [String] Id of the user you want to search plans for
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :planned_time_breakdown Defines how detailed you would like to see the breakdown of the planned time for each plan.You can add one or both of these values as query params [DAILY, PERIOD] to see more detailed breakdown of planned time.
    # @option opts [String] :from Retrieve plans starting with this date
    # @option opts [String] :to Retrieve plans that ends up to and including this date
    # @option opts [String] :updated_from Retrieve plans that have been updated from this date
    # @return [Array<(PlanResults, Integer, Hash)>] PlanResults data, response status code and response headers
    def get_plans_for_user_with_http_info(account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PlansApi.get_plans_for_user ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling PlansApi.get_plans_for_user"
      end
      # resource path
      local_var_path = '/plans/user/{accountId}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'plannedTimeBreakdown'] = @api_client.build_collection_param(opts[:'planned_time_breakdown'], :multi) if !opts[:'planned_time_breakdown'].nil?
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'to'] = opts[:'to'] if !opts[:'to'].nil?
      query_params[:'updatedFrom'] = opts[:'updated_from'] if !opts[:'updated_from'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'PlanResults'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"PlansApi.get_plans_for_user",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PlansApi#get_plans_for_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Plan
    # Updates an existing Plan for the given id using the provided input and returns the updated Plan
    # @param id [Integer] An id that uniquely identifies the Plan
    # @param [Hash] opts the optional parameters
    # @option opts [PlanInput] :plan_input 
    # @return [Plan]
    def update_plan(id, opts = {})
      data, _status_code, _headers = update_plan_with_http_info(id, opts)
      data
    end

    # Update Plan
    # Updates an existing Plan for the given id using the provided input and returns the updated Plan
    # @param id [Integer] An id that uniquely identifies the Plan
    # @param [Hash] opts the optional parameters
    # @option opts [PlanInput] :plan_input 
    # @return [Array<(Plan, Integer, Hash)>] Plan data, response status code and response headers
    def update_plan_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PlansApi.update_plan ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling PlansApi.update_plan"
      end
      # resource path
      local_var_path = '/plans/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'plan_input'])

      # return_type
      return_type = opts[:debug_return_type] || 'Plan'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"PlansApi.update_plan",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PlansApi#update_plan\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
