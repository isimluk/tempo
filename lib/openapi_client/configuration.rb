=begin
#REST API documentation

#<p>Base Path: https://api.tempo.io/4</p> <div style=\"background-color: #E5F9FD;padding: 15px;margin: 20px 0;\">   This documentation is for <strong>version 4</strong> of the Tempo REST API, which is the latest version. To read documentation for version 3 of the Tempo REST API, <a href=\"https://apidocs.tempo.io/v3\"><strong>click here</strong></a>  </div>  We encourage you to join our developer community on Slack at [www.tempo.io/developers](https://www.tempo.io/developers), where you can get support from our internal experts and share best practices with other developers building with Tempo.  If you have feedback or requests, you can also reach us through our Customer Support Portal. You can find general product  information in the Tempo Help Center.  Below are links to other Tempo APIs. <ul>   <li><a href=\"https://apidocs.tempo.io/audit\">Audit API</a></li>   <li><a href=\"https://apidocs.tempo.io/cost-tracker\">Cost-Tracker API</a></li>   <li><a href=\"https://apidocs.tempo.io/jira\">Jira Links API</a></li> </ul>  ## Authentication ### Using the REST API as an individual user  You can use the REST API to interact with the data your permissions give you access to. To do so, you will need to  generate a Tempo OAuth 2.0 token.  Go to **Tempo>Settings**, scroll down to **Data Access** and select **API integration**.  Once you have a token, you need to use it inside the Authorization HTTP header. Ex:  `curl -v -H \"Authorization: Bearer $token\" \"https://api.tempo.io/4/worklogs?...\"`<br><br>  ### Using the REST API as an application developer  If you are building apps with Tempo, and have the required Tempo administrator permissions, you can quickly  obtain the OAuth 2.0 credentials you need to retrieve an access token. Access tokens grant temporary, secure  access to Tempo, based on your current permissions.  #### Obtain your credentials  Go to **Tempo>Settings**, scroll down to **Data Access** and select **OAuth 2.0 authentication**.  Enter a Redirect URI and specify the Client type and Authorization grant type. In most cases you will choose Authorization code as the Authorization grant type.  Once you click **Add**, your Client ID and Client secret are generated and you can retrieve your access token.<br><br>  ### How to retrieve an access token for a user #### Authorization grant type used is *authorization_code* ##### Step 1 Obtain an authorization code against your Jira Cloud instance :  `GET: https://{jira-cloud-instance-name}.atlassian.net/plugins/servlet/ac/io.tempo.jira/oauth-authorize/?client_id=$CLIENT_ID&redirect_uri=$REDIRECT_URI`  Where *$CLIENT_ID* and *$REDIRECT_URI* match the one you generated in **Tempo > Settings > OAuth 2.0 Applications**  You will be asked to *authorize* or *deny* access to your Tempo data. Granting access redirects you to the configured  *redirect URI* with a new query string parameter named *code* (this is the authorization code). Note that this authorization code  expires quickly.  ![MyApp Request Access](myapp-request-access.png \"MyApp Request Access\")  ##### Step 2 Obtain an access token from Tempo by providing the *authorization code* to:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"authorization_code\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI code = $CODE ```  The response includes the access token itself, related information, and a refresh token. ```JSON {   \"access_token\":\"$ACCESS_TOKEN\",   \"expires_in\":5184000,   \"token_type\":\"Bearer\",   \"scope\":\"read write\",   \"refresh_token\":\"$REFRESH_TOKEN\" } ```  ##### Step 3 Provide this *access token* to any API requests using the *Authorization header* :  `curl -H \"Authorization: Bearer $ACCESS_TOKEN\" \"https://api.tempo.io/4/worklogs?from=2022-01-28&to=2022-02-03\"`  The access token will expire after the number of seconds specified in the **expires_in** field and will  no longer be usable.  ### How to retrieve a new access token from the refresh token The *access token* will eventually expire. You need to renew it using the previously received *refresh token*:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"refresh_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI refresh_token = $REFRESH_TOKEN ```  The response will contain a new *access token* and a new *refresh token*. You'll need to utilize these  new tokens for future calls, as the previous ones will no longer be valid.  ### How to revoke a token You can revoke an existing *access token* at any time:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` token_type_hint = \"access_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET token = $ACCESS_TOKEN ```  You can also revoke an existing *refresh token*:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` {   token_type_hint = \"refresh_token\"   client_id = $CLIENT_ID   client_secret = $CLIENT_SECRET   token = $REFRESH_TOKEN } ```  ## API conventions ### Identifying users The Tempo REST API uses the Atlassian accountId to identify users. The accountId is an opaque identifier that  uniquely identifies the user.  The accountId of the current user can found using the [Jira Myself API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-Myself).  Information about a user, given the accountId, can be retrieved using the [Jira User API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-User).  ### Dates The API uses strings to represent dates. Dates are formatted as [ISO 8601 calendar dates](https://en.wikipedia.org/wiki/ISO_8601#Calendar_dates) (YYYY-MM-DD).  For example, March 29th, 2019 is formatted as 2019-03-29.  ### Delete requests On success, delete requests return a response with status code [204 (No content)](https://httpstatuses.com/204).  No payload body is included in the response.  ### Arrays A few endpoints accept query parameters of type array. That is achieved by repeating the parameter multiple  times, e.g. to get worklogs from three projects:  `.../worklogs?from=2020-01-01&to=2020-12-31&project=10100&project=10200&project=10300`  ## Errors  The API uses standard HTTP status codes to indicate the success or failure of the API call.  Here are a list of different types of error responses  Status code  | Description | Content type ----------------|-------------|--------- 400 | Bad Request | application/json 401 | Unauthorized | text/html 403 | Forbidden | text/html 404 | Not Found | application/json  <br>  The body of the JSON response will be in the following format:  ``` {   \"errors\": {     \"message\": \"Error details\"   } } ```  An example of 400 error ```   {     \"errors\": {       \"message\": \"'date' must be valid on the format: 'yyyy-MM-dd'\"     }   } ```  An example of 404 error ```   {     \"errors\": {       \"message\": \"Account 'xyz' not found\"     }   } ``` 

The version of the OpenAPI document: 4.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.5.0-SNAPSHOT

=end

module OpenapiClient
  class Configuration
    # Defines url scheme
    attr_accessor :scheme

    # Defines url host
    attr_accessor :host

    # Defines url base path
    attr_accessor :base_path

    # Define server configuration index
    attr_accessor :server_index

    # Define server operation configuration index
    attr_accessor :server_operation_index

    # Default server variables
    attr_accessor :server_variables

    # Default server operation variables
    attr_accessor :server_operation_variables

    # Defines API keys used with API Key authentications.
    #
    # @return [Hash] key: parameter name, value: parameter value (API key)
    #
    # @example parameter name is "api_key", API key is "xxx" (e.g. "api_key=xxx" in query string)
    #   config.api_key['api_key'] = 'xxx'
    attr_accessor :api_key

    # Defines API key prefixes used with API Key authentications.
    #
    # @return [Hash] key: parameter name, value: API key prefix
    #
    # @example parameter name is "Authorization", API key prefix is "Token" (e.g. "Authorization: Token xxx" in headers)
    #   config.api_key_prefix['api_key'] = 'Token'
    attr_accessor :api_key_prefix

    # Defines the username used with HTTP basic authentication.
    #
    # @return [String]
    attr_accessor :username

    # Defines the password used with HTTP basic authentication.
    #
    # @return [String]
    attr_accessor :password

    # Defines the access token (Bearer) used with OAuth2.
    attr_accessor :access_token

    # Defines a Proc used to fetch or refresh access tokens (Bearer) used with OAuth2.
    # Overrides the access_token if set
    # @return [Proc]
    attr_accessor :access_token_getter

    # Set this to return data as binary instead of downloading a temp file. When enabled (set to true)
    # HTTP responses with return type `File` will be returned as a stream of binary data.
    # Default to false.
    attr_accessor :return_binary_data

    # Set this to enable/disable debugging. When enabled (set to true), HTTP request/response
    # details will be logged with `logger.debug` (see the `logger` attribute).
    # Default to false.
    #
    # @return [true, false]
    attr_accessor :debugging

    # Defines the logger used for debugging.
    # Default to `Rails.logger` (when in Rails) or logging to STDOUT.
    #
    # @return [#debug]
    attr_accessor :logger

    # Defines the temporary folder to store downloaded files
    # (for API endpoints that have file response).
    # Default to use `Tempfile`.
    #
    # @return [String]
    attr_accessor :temp_folder_path

    # The time limit for HTTP request in seconds.
    # Default to 0 (never times out).
    attr_accessor :timeout

    # Set this to false to skip client side validation in the operation.
    # Default to true.
    # @return [true, false]
    attr_accessor :client_side_validation

    ### TLS/SSL setting
    # Set this to false to skip verifying SSL certificate when calling API from https server.
    # Default to true.
    #
    # @note Do NOT set it to false in production code, otherwise you would face multiple types of cryptographic attacks.
    #
    # @return [true, false]
    attr_accessor :verify_ssl

    ### TLS/SSL setting
    # Set this to false to skip verifying SSL host name
    # Default to true.
    #
    # @note Do NOT set it to false in production code, otherwise you would face multiple types of cryptographic attacks.
    #
    # @return [true, false]
    attr_accessor :verify_ssl_host

    ### TLS/SSL setting
    # Set this to customize the certificate file to verify the peer.
    #
    # @return [String] the path to the certificate file
    #
    # @see The `cainfo` option of Typhoeus, `--cert` option of libcurl. Related source code:
    # https://github.com/typhoeus/typhoeus/blob/master/lib/typhoeus/easy_factory.rb#L145
    attr_accessor :ssl_ca_cert

    ### TLS/SSL setting
    # Client certificate file (for client certificate)
    attr_accessor :cert_file

    ### TLS/SSL setting
    # Client private key file (for client certificate)
    attr_accessor :key_file

    # Set this to customize parameters encoding of array parameter with multi collectionFormat.
    # Default to nil.
    #
    # @see The params_encoding option of Ethon. Related source code:
    # https://github.com/typhoeus/ethon/blob/master/lib/ethon/easy/queryable.rb#L96
    attr_accessor :params_encoding


    attr_accessor :inject_format

    attr_accessor :force_ending_format

    def initialize
      @scheme = 'https'
      @host = 'api.tempo.io'
      @base_path = '/4'
      @server_index = 0
      @server_operation_index = {}
      @server_variables = {}
      @server_operation_variables = {}
      @api_key = {}
      @api_key_prefix = {}
      @client_side_validation = true
      @verify_ssl = true
      @verify_ssl_host = true
      @cert_file = nil
      @key_file = nil
      @timeout = 0
      @params_encoding = nil
      @debugging = false
      @inject_format = false
      @force_ending_format = false
      @logger = defined?(Rails) ? Rails.logger : Logger.new(STDOUT)

      yield(self) if block_given?
    end

    # The default Configuration object.
    def self.default
      @@default ||= Configuration.new
    end

    def configure
      yield(self) if block_given?
    end

    def scheme=(scheme)
      # remove :// from scheme
      @scheme = scheme.sub(/:\/\//, '')
    end

    def host=(host)
      # remove http(s):// and anything after a slash
      @host = host.sub(/https?:\/\//, '').split('/').first
    end

    def base_path=(base_path)
      # Add leading and trailing slashes to base_path
      @base_path = "/#{base_path}".gsub(/\/+/, '/')
      @base_path = '' if @base_path == '/'
    end

    # Returns base URL for specified operation based on server settings
    def base_url(operation = nil)
      index = server_operation_index.fetch(operation, server_index)
      return "#{scheme}://#{[host, base_path].join('/').gsub(/\/+/, '/')}".sub(/\/+\z/, '') if index == nil

      server_url(index, server_operation_variables.fetch(operation, server_variables), operation_server_settings[operation])
    end

    # Gets API key (with prefix if set).
    # @param [String] param_name the parameter name of API key auth
    def api_key_with_prefix(param_name, param_alias = nil)
      key = @api_key[param_name]
      key = @api_key.fetch(param_alias, key) unless param_alias.nil?
      if @api_key_prefix[param_name]
        "#{@api_key_prefix[param_name]} #{key}"
      else
        key
      end
    end

    # Gets access_token using access_token_getter or uses the static access_token
    def access_token_with_refresh
        return access_token if access_token_getter.nil?
        access_token_getter.call
    end

    # Gets Basic Auth token string
    def basic_auth_token
      'Basic ' + ["#{username}:#{password}"].pack('m').delete("\r\n")
    end

    # Returns Auth Settings hash for api client.
    def auth_settings
      {
      }
    end

    # Returns an array of Server setting
    def server_settings
      [
        {
          url: "https://api.tempo.io/4",
          description: "No description provided",
        }
      ]
    end

    def operation_server_settings
      {
      }
    end

    # Returns URL based on server settings
    #
    # @param index array index of the server settings
    # @param variables hash of variable and the corresponding value
    def server_url(index, variables = {}, servers = nil)
      servers = server_settings if servers == nil

      # check array index out of bound
      if (index < 0 || index >= servers.size)
        fail ArgumentError, "Invalid index #{index} when selecting the server. Must be less than #{servers.size}"
      end

      server = servers[index]
      url = server[:url]

      return url unless server.key? :variables

      # go through variable and assign a value
      server[:variables].each do |name, variable|
        if variables.key?(name)
          if (!server[:variables][name].key?(:enum_values) || server[:variables][name][:enum_values].include?(variables[name]))
            url.gsub! "{" + name.to_s + "}", variables[name]
          else
            fail ArgumentError, "The variable `#{name}` in the server URL has invalid value #{variables[name]}. Must be #{server[:variables][name][:enum_values]}."
          end
        else
          # use default value
          url.gsub! "{" + name.to_s + "}", server[:variables][name][:default_value]
        end
      end

      url
    end

  end
end
