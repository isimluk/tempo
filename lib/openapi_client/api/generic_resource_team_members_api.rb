=begin
#REST API documentation

#<p>Base Path: https://api.tempo.io/4</p> <div style=\"background-color: #E5F9FD;padding: 15px;margin: 20px 0;\">   This documentation is for <strong>version 4</strong> of the Tempo REST API, which is the latest version. To read documentation for version 3 of the Tempo REST API, <a href=\"https://apidocs.tempo.io/v3\"><strong>click here</strong></a>  </div>  We encourage you to join our developer community on Slack at [www.tempo.io/developers](https://www.tempo.io/developers), where you can get support from our internal experts and share best practices with other developers building with Tempo.  If you have feedback or requests, you can also reach us through our Customer Support Portal. You can find general product  information in the Tempo Help Center.  Below are links to other Tempo APIs. <ul>   <li><a href=\"https://apidocs.tempo.io/audit\">Audit API</a></li>   <li><a href=\"https://apidocs.tempo.io/cost-tracker\">Cost-Tracker API</a></li>   <li><a href=\"https://apidocs.tempo.io/jira\">Jira Links API</a></li> </ul>  ## Authentication ### Using the REST API as an individual user  You can use the REST API to interact with the data your permissions give you access to. To do so, you will need to  generate a Tempo OAuth 2.0 token.  Go to **Tempo>Settings**, scroll down to **Data Access** and select **API integration**.  Once you have a token, you need to use it inside the Authorization HTTP header. Ex:  `curl -v -H \"Authorization: Bearer $token\" \"https://api.tempo.io/4/worklogs?...\"`<br><br>  ### Using the REST API as an application developer  If you are building apps with Tempo, and have the required Tempo administrator permissions, you can quickly  obtain the OAuth 2.0 credentials you need to retrieve an access token. Access tokens grant temporary, secure  access to Tempo, based on your current permissions.  #### Obtain your credentials  Go to **Tempo>Settings**, scroll down to **Data Access** and select **OAuth 2.0 authentication**.  Enter a Redirect URI and specify the Client type and Authorization grant type. In most cases you will choose Authorization code as the Authorization grant type.  Once you click **Add**, your Client ID and Client secret are generated and you can retrieve your access token.<br><br>  ### How to retrieve an access token for a user #### Authorization grant type used is *authorization_code* ##### Step 1 Obtain an authorization code against your Jira Cloud instance :  `GET: https://{jira-cloud-instance-name}.atlassian.net/plugins/servlet/ac/io.tempo.jira/oauth-authorize/?client_id=$CLIENT_ID&redirect_uri=$REDIRECT_URI`  Where *$CLIENT_ID* and *$REDIRECT_URI* match the one you generated in **Tempo > Settings > OAuth 2.0 Applications**  You will be asked to *authorize* or *deny* access to your Tempo data. Granting access redirects you to the configured  *redirect URI* with a new query string parameter named *code* (this is the authorization code). Note that this authorization code  expires quickly.  ![MyApp Request Access](myapp-request-access.png \"MyApp Request Access\")  ##### Step 2 Obtain an access token from Tempo by providing the *authorization code* to:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"authorization_code\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI code = $CODE ```  The response includes the access token itself, related information, and a refresh token. ```JSON {   \"access_token\":\"$ACCESS_TOKEN\",   \"expires_in\":5184000,   \"token_type\":\"Bearer\",   \"scope\":\"read write\",   \"refresh_token\":\"$REFRESH_TOKEN\" } ```  ##### Step 3 Provide this *access token* to any API requests using the *Authorization header* :  `curl -H \"Authorization: Bearer $ACCESS_TOKEN\" \"https://api.tempo.io/4/worklogs?from=2022-01-28&to=2022-02-03\"`  The access token will expire after the number of seconds specified in the **expires_in** field and will  no longer be usable.  ### How to retrieve a new access token from the refresh token The *access token* will eventually expire. You need to renew it using the previously received *refresh token*:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"refresh_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI refresh_token = $REFRESH_TOKEN ```  The response will contain a new *access token* and a new *refresh token*. You'll need to utilize these  new tokens for future calls, as the previous ones will no longer be valid.  ### How to revoke a token You can revoke an existing *access token* at any time:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` token_type_hint = \"access_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET token = $ACCESS_TOKEN ```  You can also revoke an existing *refresh token*:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` {   token_type_hint = \"refresh_token\"   client_id = $CLIENT_ID   client_secret = $CLIENT_SECRET   token = $REFRESH_TOKEN } ```  ## API conventions ### Identifying users The Tempo REST API uses the Atlassian accountId to identify users. The accountId is an opaque identifier that  uniquely identifies the user.  The accountId of the current user can found using the [Jira Myself API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-Myself).  Information about a user, given the accountId, can be retrieved using the [Jira User API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-User).  ### Dates The API uses strings to represent dates. Dates are formatted as [ISO 8601 calendar dates](https://en.wikipedia.org/wiki/ISO_8601#Calendar_dates) (YYYY-MM-DD).  For example, March 29th, 2019 is formatted as 2019-03-29.  ### Delete requests On success, delete requests return a response with status code [204 (No content)](https://httpstatuses.com/204).  No payload body is included in the response.  ### Arrays A few endpoints accept query parameters of type array. That is achieved by repeating the parameter multiple  times, e.g. to get worklogs from three projects:  `.../worklogs?from=2020-01-01&to=2020-12-31&project=10100&project=10200&project=10300`  ## Errors  The API uses standard HTTP status codes to indicate the success or failure of the API call.  Here are a list of different types of error responses  Status code  | Description | Content type ----------------|-------------|--------- 400 | Bad Request | application/json 401 | Unauthorized | text/html 403 | Forbidden | text/html 404 | Not Found | application/json  <br>  The body of the JSON response will be in the following format:  ``` {   \"errors\": {     \"message\": \"Error details\"   } } ```  An example of 400 error ```   {     \"errors\": {       \"message\": \"'date' must be valid on the format: 'yyyy-MM-dd'\"     }   } ```  An example of 404 error ```   {     \"errors\": {       \"message\": \"Account 'xyz' not found\"     }   } ``` 

The version of the OpenAPI document: 4.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.5.0-SNAPSHOT

=end

require 'cgi'

module OpenapiClient
  class GenericResourceTeamMembersApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Add Generic Resource to Team
    # Adds Generic Resource to the given Team
    # @param team_id [Integer] An id that uniquely identifies the Team which the generic resource is to be a member of
    # @param [Hash] opts the optional parameters
    # @option opts [GenericResourceTeamMemberInput] :generic_resource_team_member_input 
    # @return [GenericResourceTeamMember]
    def add_resource_to_team(team_id, opts = {})
      data, _status_code, _headers = add_resource_to_team_with_http_info(team_id, opts)
      data
    end

    # Add Generic Resource to Team
    # Adds Generic Resource to the given Team
    # @param team_id [Integer] An id that uniquely identifies the Team which the generic resource is to be a member of
    # @param [Hash] opts the optional parameters
    # @option opts [GenericResourceTeamMemberInput] :generic_resource_team_member_input 
    # @return [Array<(GenericResourceTeamMember, Integer, Hash)>] GenericResourceTeamMember data, response status code and response headers
    def add_resource_to_team_with_http_info(team_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: GenericResourceTeamMembersApi.add_resource_to_team ...'
      end
      # verify the required parameter 'team_id' is set
      if @api_client.config.client_side_validation && team_id.nil?
        fail ArgumentError, "Missing the required parameter 'team_id' when calling GenericResourceTeamMembersApi.add_resource_to_team"
      end
      # resource path
      local_var_path = '/teams/{teamId}/generic-resources'.sub('{' + 'teamId' + '}', CGI.escape(team_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'generic_resource_team_member_input'])

      # return_type
      return_type = opts[:debug_return_type] || 'GenericResourceTeamMember'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"GenericResourceTeamMembersApi.add_resource_to_team",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GenericResourceTeamMembersApi#add_resource_to_team\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve Generic Resource for Team
    # Retrieves an existing Generic Resource from the given Team
    # @param team_id [Integer] An id that uniquely identifies the Team
    # @param resource_id [Integer] An id that uniquely identifies the Generic Resource
    # @param [Hash] opts the optional parameters
    # @return [GenericResourceTeamMember]
    def get_generic_resource_team_member(team_id, resource_id, opts = {})
      data, _status_code, _headers = get_generic_resource_team_member_with_http_info(team_id, resource_id, opts)
      data
    end

    # Retrieve Generic Resource for Team
    # Retrieves an existing Generic Resource from the given Team
    # @param team_id [Integer] An id that uniquely identifies the Team
    # @param resource_id [Integer] An id that uniquely identifies the Generic Resource
    # @param [Hash] opts the optional parameters
    # @return [Array<(GenericResourceTeamMember, Integer, Hash)>] GenericResourceTeamMember data, response status code and response headers
    def get_generic_resource_team_member_with_http_info(team_id, resource_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: GenericResourceTeamMembersApi.get_generic_resource_team_member ...'
      end
      # verify the required parameter 'team_id' is set
      if @api_client.config.client_side_validation && team_id.nil?
        fail ArgumentError, "Missing the required parameter 'team_id' when calling GenericResourceTeamMembersApi.get_generic_resource_team_member"
      end
      # verify the required parameter 'resource_id' is set
      if @api_client.config.client_side_validation && resource_id.nil?
        fail ArgumentError, "Missing the required parameter 'resource_id' when calling GenericResourceTeamMembersApi.get_generic_resource_team_member"
      end
      # resource path
      local_var_path = '/teams/{teamId}/generic-resources/{resourceId}'.sub('{' + 'teamId' + '}', CGI.escape(team_id.to_s)).sub('{' + 'resourceId' + '}', CGI.escape(resource_id.to_s))

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
      return_type = opts[:debug_return_type] || 'GenericResourceTeamMember'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"GenericResourceTeamMembersApi.get_generic_resource_team_member",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GenericResourceTeamMembersApi#get_generic_resource_team_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Retrieve Generic Resources for Team
    # Retrieves a list of all Generic Resources that are members of the given Team
    # @param team_id [Integer] An id that uniquely identifies the Team from which generic resources are to be retrieved
    # @param [Hash] opts the optional parameters
    # @return [GenericResourceTeamMembers]
    def get_resources_in_team(team_id, opts = {})
      data, _status_code, _headers = get_resources_in_team_with_http_info(team_id, opts)
      data
    end

    # Retrieve Generic Resources for Team
    # Retrieves a list of all Generic Resources that are members of the given Team
    # @param team_id [Integer] An id that uniquely identifies the Team from which generic resources are to be retrieved
    # @param [Hash] opts the optional parameters
    # @return [Array<(GenericResourceTeamMembers, Integer, Hash)>] GenericResourceTeamMembers data, response status code and response headers
    def get_resources_in_team_with_http_info(team_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: GenericResourceTeamMembersApi.get_resources_in_team ...'
      end
      # verify the required parameter 'team_id' is set
      if @api_client.config.client_side_validation && team_id.nil?
        fail ArgumentError, "Missing the required parameter 'team_id' when calling GenericResourceTeamMembersApi.get_resources_in_team"
      end
      # resource path
      local_var_path = '/teams/{teamId}/generic-resources'.sub('{' + 'teamId' + '}', CGI.escape(team_id.to_s))

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
      return_type = opts[:debug_return_type] || 'GenericResourceTeamMembers'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"GenericResourceTeamMembersApi.get_resources_in_team",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GenericResourceTeamMembersApi#get_resources_in_team\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Generic Resource from Team
    # Deletes an existing Generic Resource from the given Team
    # @param team_id [Integer] An id that uniquely identifies the Team
    # @param resource_id [Integer] An id that uniquely identifies the Generic Resource
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def remove_generic_resource_from_team(team_id, resource_id, opts = {})
      remove_generic_resource_from_team_with_http_info(team_id, resource_id, opts)
      nil
    end

    # Delete Generic Resource from Team
    # Deletes an existing Generic Resource from the given Team
    # @param team_id [Integer] An id that uniquely identifies the Team
    # @param resource_id [Integer] An id that uniquely identifies the Generic Resource
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def remove_generic_resource_from_team_with_http_info(team_id, resource_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: GenericResourceTeamMembersApi.remove_generic_resource_from_team ...'
      end
      # verify the required parameter 'team_id' is set
      if @api_client.config.client_side_validation && team_id.nil?
        fail ArgumentError, "Missing the required parameter 'team_id' when calling GenericResourceTeamMembersApi.remove_generic_resource_from_team"
      end
      # verify the required parameter 'resource_id' is set
      if @api_client.config.client_side_validation && resource_id.nil?
        fail ArgumentError, "Missing the required parameter 'resource_id' when calling GenericResourceTeamMembersApi.remove_generic_resource_from_team"
      end
      # resource path
      local_var_path = '/teams/{teamId}/generic-resources/{resourceId}'.sub('{' + 'teamId' + '}', CGI.escape(team_id.to_s)).sub('{' + 'resourceId' + '}', CGI.escape(resource_id.to_s))

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
        :operation => :"GenericResourceTeamMembersApi.remove_generic_resource_from_team",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GenericResourceTeamMembersApi#remove_generic_resource_from_team\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
