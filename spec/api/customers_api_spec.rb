=begin
#REST API documentation

#<p>Base Path: https://api.tempo.io/4</p> <div style=\"background-color: #E5F9FD;padding: 15px;margin: 20px 0;\">   This documentation is for <strong>version 4</strong> of the Tempo REST API, which is the latest version. To read documentation for version 3 of the Tempo REST API, <a href=\"https://apidocs.tempo.io/v3\"><strong>click here</strong></a>  </div>  We encourage you to join our developer community on Slack at [www.tempo.io/developers](https://www.tempo.io/developers), where you can get support from our internal experts and share best practices with other developers building with Tempo.  If you have feedback or requests, you can also reach us through our Customer Support Portal. You can find general product  information in the Tempo Help Center.  Below are links to other Tempo APIs. <ul>   <li><a href=\"https://apidocs.tempo.io/audit\">Audit API</a></li>   <li><a href=\"https://apidocs.tempo.io/cost-tracker\">Cost-Tracker API</a></li>   <li><a href=\"https://apidocs.tempo.io/jira\">Jira Links API</a></li> </ul>  ## Authentication ### Using the REST API as an individual user  You can use the REST API to interact with the data your permissions give you access to. To do so, you will need to  generate a Tempo OAuth 2.0 token.  Go to **Tempo>Settings**, scroll down to **Data Access** and select **API integration**.  Once you have a token, you need to use it inside the Authorization HTTP header. Ex:  `curl -v -H \"Authorization: Bearer $token\" \"https://api.tempo.io/4/worklogs?...\"`<br><br>  ### Using the REST API as an application developer  If you are building apps with Tempo, and have the required Tempo administrator permissions, you can quickly  obtain the OAuth 2.0 credentials you need to retrieve an access token. Access tokens grant temporary, secure  access to Tempo, based on your current permissions.  #### Obtain your credentials  Go to **Tempo>Settings**, scroll down to **Data Access** and select **OAuth 2.0 authentication**.  Enter a Redirect URI and specify the Client type and Authorization grant type. In most cases you will choose Authorization code as the Authorization grant type.  Once you click **Add**, your Client ID and Client secret are generated and you can retrieve your access token.<br><br>  ### How to retrieve an access token for a user #### Authorization grant type used is *authorization_code* ##### Step 1 Obtain an authorization code against your Jira Cloud instance :  `GET: https://{jira-cloud-instance-name}.atlassian.net/plugins/servlet/ac/io.tempo.jira/oauth-authorize/?client_id=$CLIENT_ID&redirect_uri=$REDIRECT_URI`  Where *$CLIENT_ID* and *$REDIRECT_URI* match the one you generated in **Tempo > Settings > OAuth 2.0 Applications**  You will be asked to *authorize* or *deny* access to your Tempo data. Granting access redirects you to the configured  *redirect URI* with a new query string parameter named *code* (this is the authorization code). Note that this authorization code  expires quickly.  ![MyApp Request Access](myapp-request-access.png \"MyApp Request Access\")  ##### Step 2 Obtain an access token from Tempo by providing the *authorization code* to:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"authorization_code\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI code = $CODE ```  The response includes the access token itself, related information, and a refresh token. ```JSON {   \"access_token\":\"$ACCESS_TOKEN\",   \"expires_in\":5184000,   \"token_type\":\"Bearer\",   \"scope\":\"read write\",   \"refresh_token\":\"$REFRESH_TOKEN\" } ```  ##### Step 3 Provide this *access token* to any API requests using the *Authorization header* :  `curl -H \"Authorization: Bearer $ACCESS_TOKEN\" \"https://api.tempo.io/4/worklogs?from=2022-01-28&to=2022-02-03\"`  The access token will expire after the number of seconds specified in the **expires_in** field and will  no longer be usable.  ### How to retrieve a new access token from the refresh token The *access token* will eventually expire. You need to renew it using the previously received *refresh token*:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"refresh_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI refresh_token = $REFRESH_TOKEN ```  The response will contain a new *access token* and a new *refresh token*. You'll need to utilize these  new tokens for future calls, as the previous ones will no longer be valid.  ### How to revoke a token You can revoke an existing *access token* at any time:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` token_type_hint = \"access_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET token = $ACCESS_TOKEN ```  You can also revoke an existing *refresh token*:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` {   token_type_hint = \"refresh_token\"   client_id = $CLIENT_ID   client_secret = $CLIENT_SECRET   token = $REFRESH_TOKEN } ```  ## API conventions ### Identifying users The Tempo REST API uses the Atlassian accountId to identify users. The accountId is an opaque identifier that  uniquely identifies the user.  The accountId of the current user can found using the [Jira Myself API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-Myself).  Information about a user, given the accountId, can be retrieved using the [Jira User API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-User).  ### Dates The API uses strings to represent dates. Dates are formatted as [ISO 8601 calendar dates](https://en.wikipedia.org/wiki/ISO_8601#Calendar_dates) (YYYY-MM-DD).  For example, March 29th, 2019 is formatted as 2019-03-29.  ### Delete requests On success, delete requests return a response with status code [204 (No content)](https://httpstatuses.com/204).  No payload body is included in the response.  ### Arrays A few endpoints accept query parameters of type array. That is achieved by repeating the parameter multiple  times, e.g. to get worklogs from three projects:  `.../worklogs?from=2020-01-01&to=2020-12-31&project=10100&project=10200&project=10300`  ## Errors  The API uses standard HTTP status codes to indicate the success or failure of the API call.  Here are a list of different types of error responses  Status code  | Description | Content type ----------------|-------------|--------- 400 | Bad Request | application/json 401 | Unauthorized | text/html 403 | Forbidden | text/html 404 | Not Found | application/json  <br>  The body of the JSON response will be in the following format:  ``` {   \"errors\": {     \"message\": \"Error details\"   } } ```  An example of 400 error ```   {     \"errors\": {       \"message\": \"'date' must be valid on the format: 'yyyy-MM-dd'\"     }   } ```  An example of 404 error ```   {     \"errors\": {       \"message\": \"Account 'xyz' not found\"     }   } ``` 

The version of the OpenAPI document: 4.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.5.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for OpenapiClient::CustomersApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'CustomersApi' do
  before do
    # run before each test
    @api_instance = OpenapiClient::CustomersApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CustomersApi' do
    it 'should create an instance of CustomersApi' do
      expect(@api_instance).to be_instance_of(OpenapiClient::CustomersApi)
    end
  end

  # unit tests for create_customer
  # Create Customer
  # Creates a new Customer using the provided input and returns the newly created Customer
  # @param [Hash] opts the optional parameters
  # @option opts [CustomerInput] :customer_input 
  # @return [Customer]
  describe 'create_customer test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_customer
  # Delete Customer
  # Deletes the Customer with the given key
  # @param key 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_customer test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_customer_accounts
  # Retrieve Accounts associated with the Customer
  # Retrieves a list of Accounts associated with the given Customer
  # @param id An integer uniquely identifying the customer
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query
  # @option opts [Integer] :limit Limit the number of elements on the response
  # @return [PageableAccount]
  describe 'get_customer_accounts test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_customer_by_id
  # Retrieve Customer
  # Retrieves an existing Customer for the given id
  # @param id 
  # @param [Hash] opts the optional parameters
  # @return [Customer]
  describe 'get_customer_by_id test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_customers
  # Retrieve all Customers
  # Retrieves a list of all Customers
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :offset Skip over a number of elements by specifying an offset value for the query
  # @option opts [Integer] :limit Limit the number of elements on the response
  # @return [PageableCustomer]
  describe 'get_customers test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_customer
  # Update Customer
  # Updates the Customer with the given key using the provided input and returns the updated Customer
  # @param key 
  # @param [Hash] opts the optional parameters
  # @option opts [CustomerInput] :customer_input 
  # @return [Customer]
  describe 'update_customer test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
