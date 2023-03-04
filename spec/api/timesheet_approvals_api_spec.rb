=begin
#REST API documentation

#<p>Base Path: https://api.tempo.io/4</p> <div style=\"background-color: #E5F9FD;padding: 15px;margin: 20px 0;\">   This documentation is for <strong>version 4</strong> of the Tempo REST API, which is the latest version. To read documentation for version 3 of the Tempo REST API, <a href=\"https://apidocs.tempo.io/v3\"><strong>click here</strong></a>  </div>  We encourage you to join our developer community on Slack at [www.tempo.io/developers](https://www.tempo.io/developers), where you can get support from our internal experts and share best practices with other developers building with Tempo.  If you have feedback or requests, you can also reach us through our Customer Support Portal. You can find general product  information in the Tempo Help Center.  Below are links to other Tempo APIs. <ul>   <li><a href=\"https://apidocs.tempo.io/audit\">Audit API</a></li>   <li><a href=\"https://apidocs.tempo.io/cost-tracker\">Cost-Tracker API</a></li>   <li><a href=\"https://apidocs.tempo.io/jira\">Jira Links API</a></li> </ul>  ## Authentication ### Using the REST API as an individual user  You can use the REST API to interact with the data your permissions give you access to. To do so, you will need to  generate a Tempo OAuth 2.0 token.  Go to **Tempo>Settings**, scroll down to **Data Access** and select **API integration**.  Once you have a token, you need to use it inside the Authorization HTTP header. Ex:  `curl -v -H \"Authorization: Bearer $token\" \"https://api.tempo.io/4/worklogs?...\"`<br><br>  ### Using the REST API as an application developer  If you are building apps with Tempo, and have the required Tempo administrator permissions, you can quickly  obtain the OAuth 2.0 credentials you need to retrieve an access token. Access tokens grant temporary, secure  access to Tempo, based on your current permissions.  #### Obtain your credentials  Go to **Tempo>Settings**, scroll down to **Data Access** and select **OAuth 2.0 authentication**.  Enter a Redirect URI and specify the Client type and Authorization grant type. In most cases you will choose Authorization code as the Authorization grant type.  Once you click **Add**, your Client ID and Client secret are generated and you can retrieve your access token.<br><br>  ### How to retrieve an access token for a user #### Authorization grant type used is *authorization_code* ##### Step 1 Obtain an authorization code against your Jira Cloud instance :  `GET: https://{jira-cloud-instance-name}.atlassian.net/plugins/servlet/ac/io.tempo.jira/oauth-authorize/?client_id=$CLIENT_ID&redirect_uri=$REDIRECT_URI`  Where *$CLIENT_ID* and *$REDIRECT_URI* match the one you generated in **Tempo > Settings > OAuth 2.0 Applications**  You will be asked to *authorize* or *deny* access to your Tempo data. Granting access redirects you to the configured  *redirect URI* with a new query string parameter named *code* (this is the authorization code). Note that this authorization code  expires quickly.  ![MyApp Request Access](myapp-request-access.png \"MyApp Request Access\")  ##### Step 2 Obtain an access token from Tempo by providing the *authorization code* to:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"authorization_code\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI code = $CODE ```  The response includes the access token itself, related information, and a refresh token. ```JSON {   \"access_token\":\"$ACCESS_TOKEN\",   \"expires_in\":5184000,   \"token_type\":\"Bearer\",   \"scope\":\"read write\",   \"refresh_token\":\"$REFRESH_TOKEN\" } ```  ##### Step 3 Provide this *access token* to any API requests using the *Authorization header* :  `curl -H \"Authorization: Bearer $ACCESS_TOKEN\" \"https://api.tempo.io/4/worklogs?from=2022-01-28&to=2022-02-03\"`  The access token will expire after the number of seconds specified in the **expires_in** field and will  no longer be usable.  ### How to retrieve a new access token from the refresh token The *access token* will eventually expire. You need to renew it using the previously received *refresh token*:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"refresh_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI refresh_token = $REFRESH_TOKEN ```  The response will contain a new *access token* and a new *refresh token*. You'll need to utilize these  new tokens for future calls, as the previous ones will no longer be valid.  ### How to revoke a token You can revoke an existing *access token* at any time:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` token_type_hint = \"access_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET token = $ACCESS_TOKEN ```  You can also revoke an existing *refresh token*:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` {   token_type_hint = \"refresh_token\"   client_id = $CLIENT_ID   client_secret = $CLIENT_SECRET   token = $REFRESH_TOKEN } ```  ## API conventions ### Identifying users The Tempo REST API uses the Atlassian accountId to identify users. The accountId is an opaque identifier that  uniquely identifies the user.  The accountId of the current user can found using the [Jira Myself API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-Myself).  Information about a user, given the accountId, can be retrieved using the [Jira User API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-User).  ### Dates The API uses strings to represent dates. Dates are formatted as [ISO 8601 calendar dates](https://en.wikipedia.org/wiki/ISO_8601#Calendar_dates) (YYYY-MM-DD).  For example, March 29th, 2019 is formatted as 2019-03-29.  ### Delete requests On success, delete requests return a response with status code [204 (No content)](https://httpstatuses.com/204).  No payload body is included in the response.  ### Arrays A few endpoints accept query parameters of type array. That is achieved by repeating the parameter multiple  times, e.g. to get worklogs from three projects:  `.../worklogs?from=2020-01-01&to=2020-12-31&project=10100&project=10200&project=10300`  ## Errors  The API uses standard HTTP status codes to indicate the success or failure of the API call.  Here are a list of different types of error responses  Status code  | Description | Content type ----------------|-------------|--------- 400 | Bad Request | application/json 401 | Unauthorized | text/html 403 | Forbidden | text/html 404 | Not Found | application/json  <br>  The body of the JSON response will be in the following format:  ``` {   \"errors\": {     \"message\": \"Error details\"   } } ```  An example of 400 error ```   {     \"errors\": {       \"message\": \"'date' must be valid on the format: 'yyyy-MM-dd'\"     }   } ```  An example of 404 error ```   {     \"errors\": {       \"message\": \"Account 'xyz' not found\"     }   } ``` 

The version of the OpenAPI document: 4.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.5.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for OpenapiClient::TimesheetApprovalsApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'TimesheetApprovalsApi' do
  before do
    # run before each test
    @api_instance = OpenapiClient::TimesheetApprovalsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TimesheetApprovalsApi' do
    it 'should create an instance of TimesheetApprovalsApi' do
      expect(@api_instance).to be_instance_of(OpenapiClient::TimesheetApprovalsApi)
    end
  end

  # unit tests for approve_timesheet_for_user
  # Approve Timesheet
  # Approves a Timesheet for the given User in the given period and returns the approved Timesheet
  # @param account_id 
  # @param from The Start Date in format yyyy-mm-dd
  # @param [Hash] opts the optional parameters
  # @option opts [String] :to The End Date in format yyyy-mm-dd
  # @option opts [TimesheetApprovalInput] :timesheet_approval_input 
  # @return [TimesheetApproval]
  describe 'approve_timesheet_for_user test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_timesheet_approval_for_team
  # Retrieve Timesheet Approval for Team
  # Retrieves the current Timesheet Approval for a Team in the given period
  # @param team_id 
  # @param from The Start Date in format yyyy-mm-dd
  # @param [Hash] opts the optional parameters
  # @option opts [String] :to The End Date in format yyyy-mm-dd
  # @return [TimesheetApprovalResults]
  describe 'get_timesheet_approval_for_team test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_timesheet_approval_for_user
  # Retrieve current Timesheet approval
  # Retrieves the current Timesheet approval for a User in the given period
  # @param account_id 
  # @param from The Start Date in format yyyy-mm-dd
  # @param [Hash] opts the optional parameters
  # @option opts [String] :to The End Date in format yyyy-mm-dd
  # @return [TimesheetApproval]
  describe 'get_timesheet_approval_for_user test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_timesheet_approvals_waiting_for_approval
  # Retrieve Timesheets waiting for approval
  # Retrieves a list of all Timesheets waiting for approval
  # @param [Hash] opts the optional parameters
  # @return [TimesheetApprovalResults]
  describe 'get_timesheet_approvals_waiting_for_approval test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_timesheet_reviewers_for_user
  # Retrieve Timesheet reviewers for User
  # Retrieves a list of the Timesheet reviewers for the given User
  # @param account_id 
  # @param [Hash] opts the optional parameters
  # @return [UserResults]
  describe 'get_timesheet_reviewers_for_user test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for reject_timesheet_for_user
  # Reject Timesheet
  # Rejects a Timesheet for the given User in the given period and returns the rejected Timesheet
  # @param account_id 
  # @param from The Start Date in format yyyy-mm-dd
  # @param [Hash] opts the optional parameters
  # @option opts [String] :to The End Date in format yyyy-mm-dd
  # @option opts [TimesheetApprovalInput] :timesheet_approval_input 
  # @return [TimesheetApproval]
  describe 'reject_timesheet_for_user test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for reopen_timesheet_for_user
  # Reopen Timesheet
  # Reopens a Timesheet for the given User in the given period and returns the reopened Timesheet
  # @param account_id 
  # @param from The Start Date in format yyyy-mm-dd
  # @param [Hash] opts the optional parameters
  # @option opts [String] :to The End Date in format yyyy-mm-dd
  # @option opts [TimesheetApprovalInput] :timesheet_approval_input 
  # @return [TimesheetApproval]
  describe 'reopen_timesheet_for_user test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for submit_timesheet_for_user
  # Submit Timesheet
  # Submits a Timesheet for the given User in the given period and returns the submitted Timesheet
  # @param account_id 
  # @param from The Start Date in format yyyy-mm-dd
  # @param [Hash] opts the optional parameters
  # @option opts [String] :to The End Date in format yyyy-mm-dd
  # @option opts [TimesheetApprovalInput] :timesheet_approval_input 
  # @return [TimesheetApproval]
  describe 'submit_timesheet_for_user test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
