=begin
#REST API documentation

#<p>Base Path: https://api.tempo.io/4</p> <div style=\"background-color: #E5F9FD;padding: 15px;margin: 20px 0;\">   This documentation is for <strong>version 4</strong> of the Tempo REST API, which is the latest version. To read documentation for version 3 of the Tempo REST API, <a href=\"https://apidocs.tempo.io/v3\"><strong>click here</strong></a>  </div>  We encourage you to join our developer community on Slack at [www.tempo.io/developers](https://www.tempo.io/developers), where you can get support from our internal experts and share best practices with other developers building with Tempo.  If you have feedback or requests, you can also reach us through our Customer Support Portal. You can find general product  information in the Tempo Help Center.  Below are links to other Tempo APIs. <ul>   <li><a href=\"https://apidocs.tempo.io/audit\">Audit API</a></li>   <li><a href=\"https://apidocs.tempo.io/cost-tracker\">Cost-Tracker API</a></li>   <li><a href=\"https://apidocs.tempo.io/jira\">Jira Links API</a></li> </ul>  ## Authentication ### Using the REST API as an individual user  You can use the REST API to interact with the data your permissions give you access to. To do so, you will need to  generate a Tempo OAuth 2.0 token.  Go to **Tempo>Settings**, scroll down to **Data Access** and select **API integration**.  Once you have a token, you need to use it inside the Authorization HTTP header. Ex:  `curl -v -H \"Authorization: Bearer $token\" \"https://api.tempo.io/4/worklogs?...\"`<br><br>  ### Using the REST API as an application developer  If you are building apps with Tempo, and have the required Tempo administrator permissions, you can quickly  obtain the OAuth 2.0 credentials you need to retrieve an access token. Access tokens grant temporary, secure  access to Tempo, based on your current permissions.  #### Obtain your credentials  Go to **Tempo>Settings**, scroll down to **Data Access** and select **OAuth 2.0 authentication**.  Enter a Redirect URI and specify the Client type and Authorization grant type. In most cases you will choose Authorization code as the Authorization grant type.  Once you click **Add**, your Client ID and Client secret are generated and you can retrieve your access token.<br><br>  ### How to retrieve an access token for a user #### Authorization grant type used is *authorization_code* ##### Step 1 Obtain an authorization code against your Jira Cloud instance :  `GET: https://{jira-cloud-instance-name}.atlassian.net/plugins/servlet/ac/io.tempo.jira/oauth-authorize/?client_id=$CLIENT_ID&redirect_uri=$REDIRECT_URI`  Where *$CLIENT_ID* and *$REDIRECT_URI* match the one you generated in **Tempo > Settings > OAuth 2.0 Applications**  You will be asked to *authorize* or *deny* access to your Tempo data. Granting access redirects you to the configured  *redirect URI* with a new query string parameter named *code* (this is the authorization code). Note that this authorization code  expires quickly.  ![MyApp Request Access](myapp-request-access.png \"MyApp Request Access\")  ##### Step 2 Obtain an access token from Tempo by providing the *authorization code* to:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"authorization_code\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI code = $CODE ```  The response includes the access token itself, related information, and a refresh token. ```JSON {   \"access_token\":\"$ACCESS_TOKEN\",   \"expires_in\":5184000,   \"token_type\":\"Bearer\",   \"scope\":\"read write\",   \"refresh_token\":\"$REFRESH_TOKEN\" } ```  ##### Step 3 Provide this *access token* to any API requests using the *Authorization header* :  `curl -H \"Authorization: Bearer $ACCESS_TOKEN\" \"https://api.tempo.io/4/worklogs?from=2022-01-28&to=2022-02-03\"`  The access token will expire after the number of seconds specified in the **expires_in** field and will  no longer be usable.  ### How to retrieve a new access token from the refresh token The *access token* will eventually expire. You need to renew it using the previously received *refresh token*:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"refresh_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI refresh_token = $REFRESH_TOKEN ```  The response will contain a new *access token* and a new *refresh token*. You'll need to utilize these  new tokens for future calls, as the previous ones will no longer be valid.  ### How to revoke a token You can revoke an existing *access token* at any time:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` token_type_hint = \"access_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET token = $ACCESS_TOKEN ```  You can also revoke an existing *refresh token*:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` {   token_type_hint = \"refresh_token\"   client_id = $CLIENT_ID   client_secret = $CLIENT_SECRET   token = $REFRESH_TOKEN } ```  ## API conventions ### Identifying users The Tempo REST API uses the Atlassian accountId to identify users. The accountId is an opaque identifier that  uniquely identifies the user.  The accountId of the current user can found using the [Jira Myself API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-Myself).  Information about a user, given the accountId, can be retrieved using the [Jira User API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-User).  ### Dates The API uses strings to represent dates. Dates are formatted as [ISO 8601 calendar dates](https://en.wikipedia.org/wiki/ISO_8601#Calendar_dates) (YYYY-MM-DD).  For example, March 29th, 2019 is formatted as 2019-03-29.  ### Delete requests On success, delete requests return a response with status code [204 (No content)](https://httpstatuses.com/204).  No payload body is included in the response.  ### Arrays A few endpoints accept query parameters of type array. That is achieved by repeating the parameter multiple  times, e.g. to get worklogs from three projects:  `.../worklogs?from=2020-01-01&to=2020-12-31&project=10100&project=10200&project=10300`  ## Errors  The API uses standard HTTP status codes to indicate the success or failure of the API call.  Here are a list of different types of error responses  Status code  | Description | Content type ----------------|-------------|--------- 400 | Bad Request | application/json 401 | Unauthorized | text/html 403 | Forbidden | text/html 404 | Not Found | application/json  <br>  The body of the JSON response will be in the following format:  ``` {   \"errors\": {     \"message\": \"Error details\"   } } ```  An example of 400 error ```   {     \"errors\": {       \"message\": \"'date' must be valid on the format: 'yyyy-MM-dd'\"     }   } ```  An example of 404 error ```   {     \"errors\": {       \"message\": \"Account 'xyz' not found\"     }   } ``` 

The version of the OpenAPI document: 4.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.5.0-SNAPSHOT

=end

require 'cgi'

module OpenapiClient
  class WorklogsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Bulk create Work Attribute values for Worklogs
    # Note: This API only supports creating new Work Attribute values. Work Attribute values can only be updated as part of the Worklog.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<WorkAttributeValuesInput>] :work_attribute_values_input 
    # @return [nil]
    def create_work_attribute_values_for_worklogs(opts = {})
      create_work_attribute_values_for_worklogs_with_http_info(opts)
      nil
    end

    # Bulk create Work Attribute values for Worklogs
    # Note: This API only supports creating new Work Attribute values. Work Attribute values can only be updated as part of the Worklog.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<WorkAttributeValuesInput>] :work_attribute_values_input 
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def create_work_attribute_values_for_worklogs_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.create_work_attribute_values_for_worklogs ...'
      end
      # resource path
      local_var_path = '/worklogs/work-attribute-values'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'work_attribute_values_input'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.create_work_attribute_values_for_worklogs",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#create_work_attribute_values_for_worklogs\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Worklog
    # Creates a new Worklog using the provided input and returns the newly created Worklog
    # @param [Hash] opts the optional parameters
    # @option opts [WorklogInput] :worklog_input 
    # @return [Worklog]
    def create_worklog(opts = {})
      data, _status_code, _headers = create_worklog_with_http_info(opts)
      data
    end

    # Create Worklog
    # Creates a new Worklog using the provided input and returns the newly created Worklog
    # @param [Hash] opts the optional parameters
    # @option opts [WorklogInput] :worklog_input 
    # @return [Array<(Worklog, Integer, Hash)>] Worklog data, response status code and response headers
    def create_worklog_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.create_worklog ...'
      end
      # resource path
      local_var_path = '/worklogs'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'worklog_input'])

      # return_type
      return_type = opts[:debug_return_type] || 'Worklog'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.create_worklog",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#create_worklog\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Worklog 
    # Deletes an existing Worklog for the given id
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_worklog(id, opts = {})
      delete_worklog_with_http_info(id, opts)
      nil
    end

    # Delete Worklog 
    # Deletes an existing Worklog for the given id
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_worklog_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.delete_worklog ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling WorklogsApi.delete_worklog"
      end
      # resource path
      local_var_path = '/worklogs/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
        :operation => :"WorklogsApi.delete_worklog",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#delete_worklog\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve Jira Worklog ids by Tempo Worklog ids
    # Retrieves a list of existing Jira Worklog ids that match the informed Tempo Worklog ids. If a Jira Worklog Id cannot be found, it will not be returned on the results
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @option opts [TempoWorklogIdList] :tempo_worklog_id_list 
    # @return [PageableTempoToJiraWorklogId]
    def get_jira_worklog_ids_by_tempo_worklog_ids(opts = {})
      data, _status_code, _headers = get_jira_worklog_ids_by_tempo_worklog_ids_with_http_info(opts)
      data
    end

    # Retrieve Jira Worklog ids by Tempo Worklog ids
    # Retrieves a list of existing Jira Worklog ids that match the informed Tempo Worklog ids. If a Jira Worklog Id cannot be found, it will not be returned on the results
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @option opts [TempoWorklogIdList] :tempo_worklog_id_list 
    # @return [Array<(PageableTempoToJiraWorklogId, Integer, Hash)>] PageableTempoToJiraWorklogId data, response status code and response headers
    def get_jira_worklog_ids_by_tempo_worklog_ids_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.get_jira_worklog_ids_by_tempo_worklog_ids ...'
      end
      # resource path
      local_var_path = '/worklogs/tempo-to-jira'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'tempo_worklog_id_list'])

      # return_type
      return_type = opts[:debug_return_type] || 'PageableTempoToJiraWorklogId'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.get_jira_worklog_ids_by_tempo_worklog_ids",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#get_jira_worklog_ids_by_tempo_worklog_ids\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve Work Attribute value for Worklog
    # Retrieves a specific Work Attribute value using the provided key, for the given Worklog
    # @param id [String] 
    # @param key [String] 
    # @param [Hash] opts the optional parameters
    # @return [WorkAttributeValue]
    def get_work_attribute_value_for_worklog(id, key, opts = {})
      data, _status_code, _headers = get_work_attribute_value_for_worklog_with_http_info(id, key, opts)
      data
    end

    # Retrieve Work Attribute value for Worklog
    # Retrieves a specific Work Attribute value using the provided key, for the given Worklog
    # @param id [String] 
    # @param key [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(WorkAttributeValue, Integer, Hash)>] WorkAttributeValue data, response status code and response headers
    def get_work_attribute_value_for_worklog_with_http_info(id, key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.get_work_attribute_value_for_worklog ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling WorklogsApi.get_work_attribute_value_for_worklog"
      end
      # verify the required parameter 'key' is set
      if @api_client.config.client_side_validation && key.nil?
        fail ArgumentError, "Missing the required parameter 'key' when calling WorklogsApi.get_work_attribute_value_for_worklog"
      end
      # resource path
      local_var_path = '/worklogs/{id}/work-attribute-values/{key}'.sub('{' + 'id' + '}', CGI.escape(id.to_s)).sub('{' + 'key' + '}', CGI.escape(key.to_s))

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
      return_type = opts[:debug_return_type] || 'WorkAttributeValue'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.get_work_attribute_value_for_worklog",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#get_work_attribute_value_for_worklog\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve Work Attribute values for Worklog
    # Retrieves a list of all Work Attribute values for the given Worklog
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [WorkAttributeValueResults]
    def get_work_attribute_values_for_worklog(id, opts = {})
      data, _status_code, _headers = get_work_attribute_values_for_worklog_with_http_info(id, opts)
      data
    end

    # Retrieve Work Attribute values for Worklog
    # Retrieves a list of all Work Attribute values for the given Worklog
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(WorkAttributeValueResults, Integer, Hash)>] WorkAttributeValueResults data, response status code and response headers
    def get_work_attribute_values_for_worklog_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.get_work_attribute_values_for_worklog ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling WorklogsApi.get_work_attribute_values_for_worklog"
      end
      # resource path
      local_var_path = '/worklogs/{id}/work-attribute-values'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
      return_type = opts[:debug_return_type] || 'WorkAttributeValueResults'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.get_work_attribute_values_for_worklog",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#get_work_attribute_values_for_worklog\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve Worklog
    # Retrieves an existing Worklog for the given id
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [Worklog]
    def get_worklog_by_id(id, opts = {})
      data, _status_code, _headers = get_worklog_by_id_with_http_info(id, opts)
      data
    end

    # Retrieve Worklog
    # Retrieves an existing Worklog for the given id
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Worklog, Integer, Hash)>] Worklog data, response status code and response headers
    def get_worklog_by_id_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.get_worklog_by_id ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling WorklogsApi.get_worklog_by_id"
      end
      # resource path
      local_var_path = '/worklogs/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
      return_type = opts[:debug_return_type] || 'Worklog'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.get_worklog_by_id",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#get_worklog_by_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve Worklogs
    # Retrieves a list of Worklogs that matches the given search parameters
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :project_id Retrieve only worklogs for the given project ids
    # @option opts [Array<Integer>] :issue_id Retrieve only worklogs for the given issue ids
    # @option opts [String] :from Retrieve results starting with this date
    # @option opts [String] :to Retrieve results up to and including this date
    # @option opts [String] :updated_from Retrieve results that have been updated from this date
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @return [PageableWorklog]
    def get_worklogs(opts = {})
      data, _status_code, _headers = get_worklogs_with_http_info(opts)
      data
    end

    # Retrieve Worklogs
    # Retrieves a list of Worklogs that matches the given search parameters
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :project_id Retrieve only worklogs for the given project ids
    # @option opts [Array<Integer>] :issue_id Retrieve only worklogs for the given issue ids
    # @option opts [String] :from Retrieve results starting with this date
    # @option opts [String] :to Retrieve results up to and including this date
    # @option opts [String] :updated_from Retrieve results that have been updated from this date
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @return [Array<(PageableWorklog, Integer, Hash)>] PageableWorklog data, response status code and response headers
    def get_worklogs_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.get_worklogs ...'
      end
      # resource path
      local_var_path = '/worklogs'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'projectId'] = @api_client.build_collection_param(opts[:'project_id'], :multi) if !opts[:'project_id'].nil?
      query_params[:'issueId'] = @api_client.build_collection_param(opts[:'issue_id'], :multi) if !opts[:'issue_id'].nil?
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'to'] = opts[:'to'] if !opts[:'to'].nil?
      query_params[:'updatedFrom'] = opts[:'updated_from'] if !opts[:'updated_from'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'PageableWorklog'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.get_worklogs",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#get_worklogs\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Search Worklogs associated to Account
    # Retrieves a list of all Worklogs associated to the given Account key that matches the search parameters
    # @param account_key [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from Retrieve results starting with this date
    # @option opts [String] :to Retrieve results up to and including this date
    # @option opts [String] :updated_from Retrieve results that have been updated from this date
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @return [PageableWorklog]
    def get_worklogs_by_account(account_key, opts = {})
      data, _status_code, _headers = get_worklogs_by_account_with_http_info(account_key, opts)
      data
    end

    # Search Worklogs associated to Account
    # Retrieves a list of all Worklogs associated to the given Account key that matches the search parameters
    # @param account_key [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from Retrieve results starting with this date
    # @option opts [String] :to Retrieve results up to and including this date
    # @option opts [String] :updated_from Retrieve results that have been updated from this date
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @return [Array<(PageableWorklog, Integer, Hash)>] PageableWorklog data, response status code and response headers
    def get_worklogs_by_account_with_http_info(account_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.get_worklogs_by_account ...'
      end
      # verify the required parameter 'account_key' is set
      if @api_client.config.client_side_validation && account_key.nil?
        fail ArgumentError, "Missing the required parameter 'account_key' when calling WorklogsApi.get_worklogs_by_account"
      end
      # resource path
      local_var_path = '/worklogs/account/{accountKey}'.sub('{' + 'accountKey' + '}', CGI.escape(account_key.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'to'] = opts[:'to'] if !opts[:'to'].nil?
      query_params[:'updatedFrom'] = opts[:'updated_from'] if !opts[:'updated_from'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'PageableWorklog'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.get_worklogs_by_account",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#get_worklogs_by_account\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Search Worklogs associated to Issue id
    # Retrieves a list of all Worklogs associated to the given Issue id that matches the search parameters
    # @param issue_id [Integer] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from Retrieve results starting with this date
    # @option opts [String] :to Retrieve results up to and including this date
    # @option opts [String] :updated_from Retrieve results that have been updated from this date
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @return [PageableWorklog]
    def get_worklogs_by_issue_id(issue_id, opts = {})
      data, _status_code, _headers = get_worklogs_by_issue_id_with_http_info(issue_id, opts)
      data
    end

    # Search Worklogs associated to Issue id
    # Retrieves a list of all Worklogs associated to the given Issue id that matches the search parameters
    # @param issue_id [Integer] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from Retrieve results starting with this date
    # @option opts [String] :to Retrieve results up to and including this date
    # @option opts [String] :updated_from Retrieve results that have been updated from this date
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @return [Array<(PageableWorklog, Integer, Hash)>] PageableWorklog data, response status code and response headers
    def get_worklogs_by_issue_id_with_http_info(issue_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.get_worklogs_by_issue_id ...'
      end
      # verify the required parameter 'issue_id' is set
      if @api_client.config.client_side_validation && issue_id.nil?
        fail ArgumentError, "Missing the required parameter 'issue_id' when calling WorklogsApi.get_worklogs_by_issue_id"
      end
      # resource path
      local_var_path = '/worklogs/issue/{issueId}'.sub('{' + 'issueId' + '}', CGI.escape(issue_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'to'] = opts[:'to'] if !opts[:'to'].nil?
      query_params[:'updatedFrom'] = opts[:'updated_from'] if !opts[:'updated_from'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'PageableWorklog'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.get_worklogs_by_issue_id",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#get_worklogs_by_issue_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve Worklogs associated to projectId
    # Retrieves a list of all Worklogs associated to the given projectId that matches the search parameters
    # @param project_id [Integer] Id of the project you want to retrieve Worklogs for
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from Retrieve results starting with this date
    # @option opts [String] :to Retrieve results up to and including this date
    # @option opts [String] :updated_from Retrieve results that have been updated from this date
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @return [PageableWorklog]
    def get_worklogs_by_project_id(project_id, opts = {})
      data, _status_code, _headers = get_worklogs_by_project_id_with_http_info(project_id, opts)
      data
    end

    # Retrieve Worklogs associated to projectId
    # Retrieves a list of all Worklogs associated to the given projectId that matches the search parameters
    # @param project_id [Integer] Id of the project you want to retrieve Worklogs for
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from Retrieve results starting with this date
    # @option opts [String] :to Retrieve results up to and including this date
    # @option opts [String] :updated_from Retrieve results that have been updated from this date
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @return [Array<(PageableWorklog, Integer, Hash)>] PageableWorklog data, response status code and response headers
    def get_worklogs_by_project_id_with_http_info(project_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.get_worklogs_by_project_id ...'
      end
      # verify the required parameter 'project_id' is set
      if @api_client.config.client_side_validation && project_id.nil?
        fail ArgumentError, "Missing the required parameter 'project_id' when calling WorklogsApi.get_worklogs_by_project_id"
      end
      # resource path
      local_var_path = '/worklogs/project/{projectId}'.sub('{' + 'projectId' + '}', CGI.escape(project_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'to'] = opts[:'to'] if !opts[:'to'].nil?
      query_params[:'updatedFrom'] = opts[:'updated_from'] if !opts[:'updated_from'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'PageableWorklog'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.get_worklogs_by_project_id",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#get_worklogs_by_project_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Search Worklogs associated to Team
    # Retrieve a list of all Worklogs associated to the given Team id that matches the search parameters
    # @param team_id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from Retrieve results starting with this date
    # @option opts [String] :to Retrieve results up to and including this date
    # @option opts [String] :updated_from Retrieve results that have been updated from this date
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @return [PageableWorklog]
    def get_worklogs_by_team(team_id, opts = {})
      data, _status_code, _headers = get_worklogs_by_team_with_http_info(team_id, opts)
      data
    end

    # Search Worklogs associated to Team
    # Retrieve a list of all Worklogs associated to the given Team id that matches the search parameters
    # @param team_id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from Retrieve results starting with this date
    # @option opts [String] :to Retrieve results up to and including this date
    # @option opts [String] :updated_from Retrieve results that have been updated from this date
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @return [Array<(PageableWorklog, Integer, Hash)>] PageableWorklog data, response status code and response headers
    def get_worklogs_by_team_with_http_info(team_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.get_worklogs_by_team ...'
      end
      # verify the required parameter 'team_id' is set
      if @api_client.config.client_side_validation && team_id.nil?
        fail ArgumentError, "Missing the required parameter 'team_id' when calling WorklogsApi.get_worklogs_by_team"
      end
      # resource path
      local_var_path = '/worklogs/team/{teamId}'.sub('{' + 'teamId' + '}', CGI.escape(team_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'to'] = opts[:'to'] if !opts[:'to'].nil?
      query_params[:'updatedFrom'] = opts[:'updated_from'] if !opts[:'updated_from'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'PageableWorklog'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.get_worklogs_by_team",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#get_worklogs_by_team\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Search Worklogs associated to User
    # Retrieves a list of all Worklogs associated to the given User that matches the search parameters
    # @param account_id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from Retrieve results starting with this date
    # @option opts [String] :to Retrieve results up to and including this date
    # @option opts [String] :updated_from Retrieve results that have been updated from this date
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @return [PageableWorklog]
    def get_worklogs_by_user(account_id, opts = {})
      data, _status_code, _headers = get_worklogs_by_user_with_http_info(account_id, opts)
      data
    end

    # Search Worklogs associated to User
    # Retrieves a list of all Worklogs associated to the given User that matches the search parameters
    # @param account_id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :from Retrieve results starting with this date
    # @option opts [String] :to Retrieve results up to and including this date
    # @option opts [String] :updated_from Retrieve results that have been updated from this date
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @return [Array<(PageableWorklog, Integer, Hash)>] PageableWorklog data, response status code and response headers
    def get_worklogs_by_user_with_http_info(account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.get_worklogs_by_user ...'
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling WorklogsApi.get_worklogs_by_user"
      end
      # resource path
      local_var_path = '/worklogs/user/{accountId}'.sub('{' + 'accountId' + '}', CGI.escape(account_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'to'] = opts[:'to'] if !opts[:'to'].nil?
      query_params[:'updatedFrom'] = opts[:'updated_from'] if !opts[:'updated_from'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'PageableWorklog'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.get_worklogs_by_user",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#get_worklogs_by_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Search Worklogs
    # Retrieves a list of existing Worklogs that matches the given search parameters
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @option opts [WorklogSearchInput] :worklog_search_input 
    # @return [PageableWorklog]
    def search_worklogs(opts = {})
      data, _status_code, _headers = search_worklogs_with_http_info(opts)
      data
    end

    # Search Worklogs
    # Retrieves a list of existing Worklogs that matches the given search parameters
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query (default to 0)
    # @option opts [Integer] :limit Limit the number of elements on the response (default to 50)
    # @option opts [WorklogSearchInput] :worklog_search_input 
    # @return [Array<(PageableWorklog, Integer, Hash)>] PageableWorklog data, response status code and response headers
    def search_worklogs_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.search_worklogs ...'
      end
      # resource path
      local_var_path = '/worklogs/search'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'worklog_search_input'])

      # return_type
      return_type = opts[:debug_return_type] || 'PageableWorklog'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.search_worklogs",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#search_worklogs\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Worklog
    # Updates an existing Worklog for the given id using the provided input and returns the updated Worklog
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [WorklogInput] :worklog_input 
    # @return [Worklog]
    def update_worklog(id, opts = {})
      data, _status_code, _headers = update_worklog_with_http_info(id, opts)
      data
    end

    # Update Worklog
    # Updates an existing Worklog for the given id using the provided input and returns the updated Worklog
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [WorklogInput] :worklog_input 
    # @return [Array<(Worklog, Integer, Hash)>] Worklog data, response status code and response headers
    def update_worklog_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WorklogsApi.update_worklog ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling WorklogsApi.update_worklog"
      end
      # resource path
      local_var_path = '/worklogs/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'worklog_input'])

      # return_type
      return_type = opts[:debug_return_type] || 'Worklog'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"WorklogsApi.update_worklog",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: WorklogsApi#update_worklog\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
