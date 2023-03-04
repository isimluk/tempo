# openapi_client

OpenapiClient - the Ruby gem for the REST API documentation

<p>Base Path: https://api.tempo.io/4</p>
<div style=\"background-color: #E5F9FD;padding: 15px;margin: 20px 0;\">
  This documentation is for <strong>version 4</strong> of the Tempo REST API, which is the latest version. To read documentation for version 3 of the Tempo REST API, <a href=\"https://apidocs.tempo.io/v3\"><strong>click here</strong></a> 
</div>

We encourage you to join our developer community on Slack at [www.tempo.io/developers](https://www.tempo.io/developers), where you
can get support from our internal experts and share best practices with other developers building with Tempo.

If you have feedback or requests, you can also reach us through our Customer Support Portal. You can find general product 
information in the Tempo Help Center.

Below are links to other Tempo APIs.
<ul>
  <li><a href=\"https://apidocs.tempo.io/audit\">Audit API</a></li>
  <li><a href=\"https://apidocs.tempo.io/cost-tracker\">Cost-Tracker API</a></li>
  <li><a href=\"https://apidocs.tempo.io/jira\">Jira Links API</a></li>
</ul>

## Authentication
### Using the REST API as an individual user

You can use the REST API to interact with the data your permissions give you access to. To do so, you will need to 
generate a Tempo OAuth 2.0 token.

Go to **Tempo>Settings**, scroll down to **Data Access** and select **API integration**.

Once you have a token, you need to use it inside the Authorization HTTP header. Ex:

`curl -v -H \"Authorization: Bearer $token\" \"https://api.tempo.io/4/worklogs?...\"`<br><br>

### Using the REST API as an application developer

If you are building apps with Tempo, and have the required Tempo administrator permissions, you can quickly 
obtain the OAuth 2.0 credentials you need to retrieve an access token. Access tokens grant temporary, secure 
access to Tempo, based on your current permissions.

#### Obtain your credentials

Go to **Tempo>Settings**, scroll down to **Data Access** and select **OAuth 2.0 authentication**.

Enter a Redirect URI and specify the Client type and Authorization grant type. In most cases you will choose
Authorization code as the Authorization grant type.

Once you click **Add**, your Client ID and Client secret are generated and you can retrieve your access token.<br><br>

### How to retrieve an access token for a user
#### Authorization grant type used is *authorization_code*
##### Step 1
Obtain an authorization code against your Jira Cloud instance :

`GET: https://{jira-cloud-instance-name}.atlassian.net/plugins/servlet/ac/io.tempo.jira/oauth-authorize/?client_id=$CLIENT_ID&redirect_uri=$REDIRECT_URI`

Where *$CLIENT_ID* and *$REDIRECT_URI* match the one you generated in **Tempo > Settings > OAuth 2.0 Applications**

You will be asked to *authorize* or *deny* access to your Tempo data. Granting access redirects you to the configured 
*redirect URI* with a new query string parameter named *code* (this is the authorization code). Note that this authorization code 
expires quickly.

![MyApp Request Access](myapp-request-access.png \"MyApp Request Access\")

##### Step 2
Obtain an access token from Tempo by providing the *authorization code* to:

`POST: https://api.tempo.io/oauth/token/`

sending the following parameters using the \"application/x-www-form-urlencoded\" format:
```
grant_type = \"authorization_code\"
client_id = $CLIENT_ID
client_secret = $CLIENT_SECRET
redirect_uri = $REDIRECT_URI
code = $CODE
```

The response includes the access token itself, related information, and a refresh token.
```JSON
{
  \"access_token\":\"$ACCESS_TOKEN\",
  \"expires_in\":5184000,
  \"token_type\":\"Bearer\",
  \"scope\":\"read write\",
  \"refresh_token\":\"$REFRESH_TOKEN\"
}
```

##### Step 3
Provide this *access token* to any API requests using the *Authorization header* :

`curl -H \"Authorization: Bearer $ACCESS_TOKEN\" \"https://api.tempo.io/4/worklogs?from=2022-01-28&to=2022-02-03\"`

The access token will expire after the number of seconds specified in the **expires_in** field and will 
no longer be usable.

### How to retrieve a new access token from the refresh token
The *access token* will eventually expire. You need to renew it using the previously received *refresh token*:

`POST: https://api.tempo.io/oauth/token/`

sending the following parameters using the \"application/x-www-form-urlencoded\" format:
```
grant_type = \"refresh_token\"
client_id = $CLIENT_ID
client_secret = $CLIENT_SECRET
redirect_uri = $REDIRECT_URI
refresh_token = $REFRESH_TOKEN
```

The response will contain a new *access token* and a new *refresh token*. You'll need to utilize these 
new tokens for future calls, as the previous ones will no longer be valid.

### How to revoke a token
You can revoke an existing *access token* at any time:

`POST: https://api.tempo.io/oauth/revoke_token/`

sending the following parameters using the \"application/x-www-form-urlencoded\" format:
```
token_type_hint = \"access_token\"
client_id = $CLIENT_ID
client_secret = $CLIENT_SECRET
token = $ACCESS_TOKEN
```

You can also revoke an existing *refresh token*:

`POST: https://api.tempo.io/oauth/revoke_token/`

sending the following parameters using the \"application/x-www-form-urlencoded\" format:
```
{
  token_type_hint = \"refresh_token\"
  client_id = $CLIENT_ID
  client_secret = $CLIENT_SECRET
  token = $REFRESH_TOKEN
}
```

## API conventions
### Identifying users
The Tempo REST API uses the Atlassian accountId to identify users. The accountId is an opaque identifier that 
uniquely identifies the user.

The accountId of the current user can found using the [Jira Myself API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-Myself).

Information about a user, given the accountId, can be retrieved using the [Jira User API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-User).

### Dates
The API uses strings to represent dates. Dates are formatted as [ISO 8601 calendar dates](https://en.wikipedia.org/wiki/ISO_8601#Calendar_dates) (YYYY-MM-DD). 
For example, March 29th, 2019 is formatted as 2019-03-29.

### Delete requests
On success, delete requests return a response with status code [204 (No content)](https://httpstatuses.com/204). 
No payload body is included in the response.

### Arrays
A few endpoints accept query parameters of type array. That is achieved by repeating the parameter multiple 
times, e.g. to get worklogs from three projects:

`.../worklogs?from=2020-01-01&to=2020-12-31&project=10100&project=10200&project=10300`

## Errors

The API uses standard HTTP status codes to indicate the success or failure of the API call.

Here are a list of different types of error responses

Status code  | Description | Content type
----------------|-------------|---------
400 | Bad Request | application/json
401 | Unauthorized | text/html
403 | Forbidden | text/html
404 | Not Found | application/json

<br>

The body of the JSON response will be in the following format:

```
{
  \"errors\": {
    \"message\": \"Error details\"
  }
}
```

An example of 400 error
```
  {
    \"errors\": {
      \"message\": \"'date' must be valid on the format: 'yyyy-MM-dd'\"
    }
  }
```

An example of 404 error
```
  {
    \"errors\": {
      \"message\": \"Account 'xyz' not found\"
    }
  }
```


This SDK is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 4.0
- Package version: 1.0.0
- Build package: org.openapitools.codegen.languages.RubyClientCodegen

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build openapi_client.gemspec
```

Then either install the gem locally:

```shell
gem install ./openapi_client-1.0.0.gem
```

(for development, run `gem install --dev ./openapi_client-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'openapi_client', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'openapi_client', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:

```ruby
# Load the gem
require 'openapi_client'

api_instance = OpenapiClient::AccountCategoriesApi.new
opts = {
  category_input: OpenapiClient::CategoryInput.new({key: 'CLOUDBAY_DEVELOPMENT', name: 'Cloudbay: Development'}) # CategoryInput | 
}

begin
  #Create Category
  result = api_instance.create_category(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Exception when calling AccountCategoriesApi->create_category: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://api.tempo.io/4*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*OpenapiClient::AccountCategoriesApi* | [**create_category**](docs/AccountCategoriesApi.md#create_category) | **POST** /account-categories | Create Category
*OpenapiClient::AccountCategoriesApi* | [**delete_category**](docs/AccountCategoriesApi.md#delete_category) | **DELETE** /account-categories/{key} | Delete Category
*OpenapiClient::AccountCategoriesApi* | [**get_categories**](docs/AccountCategoriesApi.md#get_categories) | **GET** /account-categories | Retrieve Category / Retrieve all Categories
*OpenapiClient::AccountCategoriesApi* | [**get_category_by_key**](docs/AccountCategoriesApi.md#get_category_by_key) | **GET** /account-categories/{key} | Retrieve Category
*OpenapiClient::AccountCategoriesApi* | [**update_category**](docs/AccountCategoriesApi.md#update_category) | **PUT** /account-categories/{key} | Update Category
*OpenapiClient::AccountCategoryTypesApi* | [**get_types**](docs/AccountCategoryTypesApi.md#get_types) | **GET** /account-category-types | Retrieve Category Types
*OpenapiClient::AccountLinksApi* | [**create_link**](docs/AccountLinksApi.md#create_link) | **POST** /account-links | Create Account Link
*OpenapiClient::AccountLinksApi* | [**delete_link**](docs/AccountLinksApi.md#delete_link) | **DELETE** /account-links/{id} | Delete Account Link
*OpenapiClient::AccountLinksApi* | [**get_link**](docs/AccountLinksApi.md#get_link) | **GET** /account-links/{id} | Retrieve Account Link
*OpenapiClient::AccountLinksApi* | [**get_links_by_project**](docs/AccountLinksApi.md#get_links_by_project) | **GET** /account-links/project/{id} | Retrieve Account Link by Project
*OpenapiClient::AccountsApi* | [**create_account**](docs/AccountsApi.md#create_account) | **POST** /accounts | Create new Account
*OpenapiClient::AccountsApi* | [**delete_account**](docs/AccountsApi.md#delete_account) | **DELETE** /accounts/{key} | Delete Account
*OpenapiClient::AccountsApi* | [**get_account_by_id**](docs/AccountsApi.md#get_account_by_id) | **GET** /accounts/{id} | Retrieve Account
*OpenapiClient::AccountsApi* | [**get_account_links**](docs/AccountsApi.md#get_account_links) | **GET** /accounts/{key}/links | Retrieve Account links
*OpenapiClient::AccountsApi* | [**get_accounts**](docs/AccountsApi.md#get_accounts) | **GET** /accounts | Retrieve Accounts
*OpenapiClient::AccountsApi* | [**search_accounts**](docs/AccountsApi.md#search_accounts) | **POST** /accounts/search | Search Accounts
*OpenapiClient::AccountsApi* | [**update_account**](docs/AccountsApi.md#update_account) | **PUT** /accounts/{key} | Update Account
*OpenapiClient::CustomersApi* | [**create_customer**](docs/CustomersApi.md#create_customer) | **POST** /customers | Create Customer
*OpenapiClient::CustomersApi* | [**delete_customer**](docs/CustomersApi.md#delete_customer) | **DELETE** /customers/{key} | Delete Customer
*OpenapiClient::CustomersApi* | [**get_customer_accounts**](docs/CustomersApi.md#get_customer_accounts) | **GET** /customers/{id}/accounts | Retrieve Accounts associated with the Customer
*OpenapiClient::CustomersApi* | [**get_customer_by_id**](docs/CustomersApi.md#get_customer_by_id) | **GET** /customers/{id} | Retrieve Customer
*OpenapiClient::CustomersApi* | [**get_customers**](docs/CustomersApi.md#get_customers) | **GET** /customers | Retrieve all Customers
*OpenapiClient::CustomersApi* | [**update_customer**](docs/CustomersApi.md#update_customer) | **PUT** /customers/{key} | Update Customer
*OpenapiClient::GenericResourceTeamMembersApi* | [**add_resource_to_team**](docs/GenericResourceTeamMembersApi.md#add_resource_to_team) | **POST** /teams/{teamId}/generic-resources | Add Generic Resource to Team
*OpenapiClient::GenericResourceTeamMembersApi* | [**get_generic_resource_team_member**](docs/GenericResourceTeamMembersApi.md#get_generic_resource_team_member) | **GET** /teams/{teamId}/generic-resources/{resourceId} | Retrieve Generic Resource for Team
*OpenapiClient::GenericResourceTeamMembersApi* | [**get_resources_in_team**](docs/GenericResourceTeamMembersApi.md#get_resources_in_team) | **GET** /teams/{teamId}/generic-resources | Retrieve Generic Resources for Team
*OpenapiClient::GenericResourceTeamMembersApi* | [**remove_generic_resource_from_team**](docs/GenericResourceTeamMembersApi.md#remove_generic_resource_from_team) | **DELETE** /teams/{teamId}/generic-resources/{resourceId} | Delete Generic Resource from Team
*OpenapiClient::GenericResourcesApi* | [**create_generic_resource**](docs/GenericResourcesApi.md#create_generic_resource) | **POST** /generic-resources | Create Generic Resource
*OpenapiClient::GenericResourcesApi* | [**delete_generic_resource**](docs/GenericResourcesApi.md#delete_generic_resource) | **DELETE** /generic-resources/{id} | Delete Generic Resource
*OpenapiClient::GenericResourcesApi* | [**edit_generic_resource**](docs/GenericResourcesApi.md#edit_generic_resource) | **PUT** /generic-resources/{id} | Update Generic Resource
*OpenapiClient::GenericResourcesApi* | [**get_generic_resource**](docs/GenericResourcesApi.md#get_generic_resource) | **GET** /generic-resources/{id} | Retrieve Generic Resource
*OpenapiClient::GenericResourcesApi* | [**search_generic_resources**](docs/GenericResourcesApi.md#search_generic_resources) | **POST** /generic-resources/search | Search Generic Resources
*OpenapiClient::GlobalConfigurationsApi* | [**get_global_configuration**](docs/GlobalConfigurationsApi.md#get_global_configuration) | **GET** /globalconfiguration | Retrieve Global Configurations
*OpenapiClient::HolidaySchemesApi* | [**create_holiday**](docs/HolidaySchemesApi.md#create_holiday) | **POST** /holiday-schemes/{schemeId}/holidays | Add holiday
*OpenapiClient::HolidaySchemesApi* | [**create_holiday_scheme**](docs/HolidaySchemesApi.md#create_holiday_scheme) | **POST** /holiday-schemes | Add holiday scheme
*OpenapiClient::HolidaySchemesApi* | [**delete_holiday**](docs/HolidaySchemesApi.md#delete_holiday) | **DELETE** /holiday-schemes/{schemeId}/holidays/{holidayId} | Delete holiday
*OpenapiClient::HolidaySchemesApi* | [**delete_holiday_scheme**](docs/HolidaySchemesApi.md#delete_holiday_scheme) | **DELETE** /holiday-schemes/{schemeId} | Delete a holiday scheme
*OpenapiClient::HolidaySchemesApi* | [**get_floating_holidays**](docs/HolidaySchemesApi.md#get_floating_holidays) | **GET** /holiday-schemes/{schemeId}/holidays/floating | Get floating holidays
*OpenapiClient::HolidaySchemesApi* | [**get_holiday**](docs/HolidaySchemesApi.md#get_holiday) | **GET** /holiday-schemes/{schemeId}/holidays/{holidayId} | Get holiday
*OpenapiClient::HolidaySchemesApi* | [**get_holiday_scheme**](docs/HolidaySchemesApi.md#get_holiday_scheme) | **GET** /holiday-schemes/{schemeId} | Get holiday scheme
*OpenapiClient::HolidaySchemesApi* | [**get_holiday_schemes**](docs/HolidaySchemesApi.md#get_holiday_schemes) | **GET** /holiday-schemes | Get holiday schemes
*OpenapiClient::HolidaySchemesApi* | [**get_holidays**](docs/HolidaySchemesApi.md#get_holidays) | **GET** /holiday-schemes/{schemeId}/holidays | Get holidays
*OpenapiClient::HolidaySchemesApi* | [**get_user_holiday_scheme**](docs/HolidaySchemesApi.md#get_user_holiday_scheme) | **GET** /holiday-schemes/users/{accountId} | Get user scheme
*OpenapiClient::HolidaySchemesApi* | [**get_workload_scheme_members**](docs/HolidaySchemesApi.md#get_workload_scheme_members) | **GET** /holiday-schemes/{schemeId}/members | Get members in a holiday scheme
*OpenapiClient::HolidaySchemesApi* | [**set_default_scheme**](docs/HolidaySchemesApi.md#set_default_scheme) | **PUT** /holiday-schemes/{schemeId}/default | Set the default holiday scheme
*OpenapiClient::HolidaySchemesApi* | [**set_workload_scheme_membership**](docs/HolidaySchemesApi.md#set_workload_scheme_membership) | **POST** /holiday-schemes/{schemeId}/members | Set holiday scheme to members
*OpenapiClient::HolidaySchemesApi* | [**update_holiday**](docs/HolidaySchemesApi.md#update_holiday) | **PUT** /holiday-schemes/{schemeId}/holidays/{holidayId} | Update a holiday
*OpenapiClient::HolidaySchemesApi* | [**update_holiday_scheme**](docs/HolidaySchemesApi.md#update_holiday_scheme) | **PUT** /holiday-schemes/{schemeId} | Update a holiday scheme
*OpenapiClient::PeriodsApi* | [**get_periods**](docs/PeriodsApi.md#get_periods) | **GET** /periods | Retrieve Periods
*OpenapiClient::PermissionRolesApi* | [**create_permission_group**](docs/PermissionRolesApi.md#create_permission_group) | **POST** /permission-roles | Create Permission Role
*OpenapiClient::PermissionRolesApi* | [**delete_editable_permission_group**](docs/PermissionRolesApi.md#delete_editable_permission_group) | **DELETE** /permission-roles/{id} | Delete Permission Role
*OpenapiClient::PermissionRolesApi* | [**get_global_permission_roles**](docs/PermissionRolesApi.md#get_global_permission_roles) | **GET** /permission-roles/global | Retrieve Global Permission Roles
*OpenapiClient::PermissionRolesApi* | [**get_permission_role**](docs/PermissionRolesApi.md#get_permission_role) | **GET** /permission-roles/{id} | Retrieve Permission Role
*OpenapiClient::PermissionRolesApi* | [**get_permission_roles**](docs/PermissionRolesApi.md#get_permission_roles) | **GET** /permission-roles | Retrieve Permission Roles
*OpenapiClient::PermissionRolesApi* | [**update_permission_group**](docs/PermissionRolesApi.md#update_permission_group) | **PUT** /permission-roles/{id} | Update Permission Role
*OpenapiClient::PlansApi* | [**create_plan**](docs/PlansApi.md#create_plan) | **POST** /plans | Create Plan
*OpenapiClient::PlansApi* | [**delete_plan_by_id**](docs/PlansApi.md#delete_plan_by_id) | **DELETE** /plans/{id} | Delete Plan
*OpenapiClient::PlansApi* | [**get_plan_by_id**](docs/PlansApi.md#get_plan_by_id) | **GET** /plans/{id} | Retrieve Plan
*OpenapiClient::PlansApi* | [**get_plans**](docs/PlansApi.md#get_plans) | **POST** /plans/search | Search Plans
*OpenapiClient::PlansApi* | [**get_plans_for_generic_resource**](docs/PlansApi.md#get_plans_for_generic_resource) | **GET** /plans/generic-resource/{genericResourceId} | Retrieve Plans for Generic Resource
*OpenapiClient::PlansApi* | [**get_plans_for_user**](docs/PlansApi.md#get_plans_for_user) | **GET** /plans/user/{accountId} | Retrieve Plans for User
*OpenapiClient::PlansApi* | [**update_plan**](docs/PlansApi.md#update_plan) | **PUT** /plans/{id} | Update Plan
*OpenapiClient::ProgramApi* | [**create_program**](docs/ProgramApi.md#create_program) | **POST** /programs | Create Program
*OpenapiClient::ProgramApi* | [**delete_program**](docs/ProgramApi.md#delete_program) | **DELETE** /programs/{id} | Delete Program
*OpenapiClient::ProgramApi* | [**get_program_by_id**](docs/ProgramApi.md#get_program_by_id) | **GET** /programs/{id} | Retrieve Program
*OpenapiClient::ProgramApi* | [**get_programs**](docs/ProgramApi.md#get_programs) | **GET** /programs | Retrieve all Programs
*OpenapiClient::ProgramApi* | [**get_teams_by_program_id**](docs/ProgramApi.md#get_teams_by_program_id) | **GET** /programs/{id}/teams | Retrieve Teams associated with Program
*OpenapiClient::ProgramApi* | [**update_program**](docs/ProgramApi.md#update_program) | **PUT** /programs/{id} | Update Program
*OpenapiClient::RolesApi* | [**create_role**](docs/RolesApi.md#create_role) | **POST** /roles | Create new Role
*OpenapiClient::RolesApi* | [**delete_role**](docs/RolesApi.md#delete_role) | **DELETE** /roles/{id} | Delete Role
*OpenapiClient::RolesApi* | [**get_all_roles**](docs/RolesApi.md#get_all_roles) | **GET** /roles | Retrieve Roles
*OpenapiClient::RolesApi* | [**get_default_role**](docs/RolesApi.md#get_default_role) | **GET** /roles/default | Retrieve default Role
*OpenapiClient::RolesApi* | [**get_role_by_id**](docs/RolesApi.md#get_role_by_id) | **GET** /roles/{id} | Retrieve Role by id
*OpenapiClient::RolesApi* | [**update_role**](docs/RolesApi.md#update_role) | **PUT** /roles/{id} | Update Role
*OpenapiClient::SkillAssignmentsApi* | [**assign_skills**](docs/SkillAssignmentsApi.md#assign_skills) | **POST** /skill-assignments | Assign Skills for Resource
*OpenapiClient::SkillAssignmentsApi* | [**get_skill_assignments**](docs/SkillAssignmentsApi.md#get_skill_assignments) | **GET** /skill-assignments/{assigneeId}/{assigneeType} | Retrieve Skill Assignments for Resource
*OpenapiClient::SkillAssignmentsApi* | [**remove_skill_assignment**](docs/SkillAssignmentsApi.md#remove_skill_assignment) | **DELETE** /skill-assignments/{assigneeId}/{assigneeType}/{skillId} | Delete skill of the Resource
*OpenapiClient::SkillAssignmentsApi* | [**replace_skill_assignments**](docs/SkillAssignmentsApi.md#replace_skill_assignments) | **POST** /skill-assignments/replace | Replace skills for Resource
*OpenapiClient::SkillsApi* | [**create_skill**](docs/SkillsApi.md#create_skill) | **POST** /skills | Create Skill
*OpenapiClient::SkillsApi* | [**delete_skill**](docs/SkillsApi.md#delete_skill) | **DELETE** /skills/{id} | Delete Skill
*OpenapiClient::SkillsApi* | [**get_skill**](docs/SkillsApi.md#get_skill) | **GET** /skills/{id} | Retrieve Skill
*OpenapiClient::SkillsApi* | [**get_skills**](docs/SkillsApi.md#get_skills) | **GET** /skills | Retrieve Skills
*OpenapiClient::SkillsApi* | [**update_skill**](docs/SkillsApi.md#update_skill) | **PUT** /skills/{id} | Update Skill
*OpenapiClient::TeamApi* | [**create_team**](docs/TeamApi.md#create_team) | **POST** /teams | Create Team
*OpenapiClient::TeamApi* | [**delete_team**](docs/TeamApi.md#delete_team) | **DELETE** /teams/{id} | Delete Team
*OpenapiClient::TeamApi* | [**get_team_by_id**](docs/TeamApi.md#get_team_by_id) | **GET** /teams/{id} | Retrieve Team
*OpenapiClient::TeamApi* | [**get_team_links**](docs/TeamApi.md#get_team_links) | **GET** /teams/{id}/links | Retrieve Links from Team
*OpenapiClient::TeamApi* | [**get_teams**](docs/TeamApi.md#get_teams) | **GET** /teams | Retrieve Teams
*OpenapiClient::TeamApi* | [**update_team**](docs/TeamApi.md#update_team) | **PUT** /teams/{id} | Update Team
*OpenapiClient::TeamLinksApi* | [**create_team_link**](docs/TeamLinksApi.md#create_team_link) | **POST** /team-links | Create Team Link
*OpenapiClient::TeamLinksApi* | [**delete_team_link**](docs/TeamLinksApi.md#delete_team_link) | **DELETE** /team-links/{linkId} | Delete Team Link
*OpenapiClient::TeamLinksApi* | [**get_team_link**](docs/TeamLinksApi.md#get_team_link) | **GET** /team-links/{linkId} | Retrieve Team Link
*OpenapiClient::TeamLinksApi* | [**get_team_link_by_project_id**](docs/TeamLinksApi.md#get_team_link_by_project_id) | **GET** /team-links/project/{id} | Retrieve Team Link by Project
*OpenapiClient::TeamMembershipsApi* | [**create_membership**](docs/TeamMembershipsApi.md#create_membership) | **POST** /team-memberships | Create Membership
*OpenapiClient::TeamMembershipsApi* | [**delete_membership**](docs/TeamMembershipsApi.md#delete_membership) | **DELETE** /team-memberships/{id} | Delete Membership
*OpenapiClient::TeamMembershipsApi* | [**get_all_memberships**](docs/TeamMembershipsApi.md#get_all_memberships) | **GET** /team-memberships/team/{teamId} | Retrieve Memberships for Team
*OpenapiClient::TeamMembershipsApi* | [**get_membership**](docs/TeamMembershipsApi.md#get_membership) | **GET** /team-memberships/{id} | Retrieve Membership
*OpenapiClient::TeamMembershipsApi* | [**update_membership**](docs/TeamMembershipsApi.md#update_membership) | **PUT** /team-memberships/{id} | Update Membership
*OpenapiClient::TimesheetApprovalsApi* | [**approve_timesheet_for_user**](docs/TimesheetApprovalsApi.md#approve_timesheet_for_user) | **POST** /timesheet-approvals/user/{accountId}/approve | Approve Timesheet
*OpenapiClient::TimesheetApprovalsApi* | [**get_timesheet_approval_for_team**](docs/TimesheetApprovalsApi.md#get_timesheet_approval_for_team) | **GET** /timesheet-approvals/team/{teamId} | Retrieve Timesheet Approval for Team
*OpenapiClient::TimesheetApprovalsApi* | [**get_timesheet_approval_for_user**](docs/TimesheetApprovalsApi.md#get_timesheet_approval_for_user) | **GET** /timesheet-approvals/user/{accountId} | Retrieve current Timesheet approval
*OpenapiClient::TimesheetApprovalsApi* | [**get_timesheet_approvals_waiting_for_approval**](docs/TimesheetApprovalsApi.md#get_timesheet_approvals_waiting_for_approval) | **GET** /timesheet-approvals/waiting | Retrieve Timesheets waiting for approval
*OpenapiClient::TimesheetApprovalsApi* | [**get_timesheet_reviewers_for_user**](docs/TimesheetApprovalsApi.md#get_timesheet_reviewers_for_user) | **GET** /timesheet-approvals/user/{accountId}/reviewers | Retrieve Timesheet reviewers for User
*OpenapiClient::TimesheetApprovalsApi* | [**reject_timesheet_for_user**](docs/TimesheetApprovalsApi.md#reject_timesheet_for_user) | **POST** /timesheet-approvals/user/{accountId}/reject | Reject Timesheet
*OpenapiClient::TimesheetApprovalsApi* | [**reopen_timesheet_for_user**](docs/TimesheetApprovalsApi.md#reopen_timesheet_for_user) | **POST** /timesheet-approvals/user/{accountId}/reopen | Reopen Timesheet
*OpenapiClient::TimesheetApprovalsApi* | [**submit_timesheet_for_user**](docs/TimesheetApprovalsApi.md#submit_timesheet_for_user) | **POST** /timesheet-approvals/user/{accountId}/submit | Submit Timesheet
*OpenapiClient::UserScheduleApi* | [**get_authenticated_user_schedule**](docs/UserScheduleApi.md#get_authenticated_user_schedule) | **GET** /user-schedule | Retrieve logged User Schedule
*OpenapiClient::UserScheduleApi* | [**get_user_schedule**](docs/UserScheduleApi.md#get_user_schedule) | **GET** /user-schedule/{accountId} | Retrieve User Schedule
*OpenapiClient::WorkAttributesApi* | [**create_work_attributes**](docs/WorkAttributesApi.md#create_work_attributes) | **POST** /work-attributes | Create Work Attribute
*OpenapiClient::WorkAttributesApi* | [**delete_work_attribute_by_key**](docs/WorkAttributesApi.md#delete_work_attribute_by_key) | **DELETE** /work-attributes/{key} | Delete Work Attribute
*OpenapiClient::WorkAttributesApi* | [**get_work_attribute_by_key**](docs/WorkAttributesApi.md#get_work_attribute_by_key) | **GET** /work-attributes/{key} | Retrieve Work Attribute
*OpenapiClient::WorkAttributesApi* | [**get_work_attributes**](docs/WorkAttributesApi.md#get_work_attributes) | **GET** /work-attributes | Retrieve Work Attributes
*OpenapiClient::WorkAttributesApi* | [**update_work_attribute_by_key**](docs/WorkAttributesApi.md#update_work_attribute_by_key) | **PUT** /work-attributes/{key} | Update Work Attribute
*OpenapiClient::WorkloadSchemesApi* | [**create_workload_scheme**](docs/WorkloadSchemesApi.md#create_workload_scheme) | **POST** /workload-schemes | Create Workload Scheme
*OpenapiClient::WorkloadSchemesApi* | [**delete_workload_scheme**](docs/WorkloadSchemesApi.md#delete_workload_scheme) | **DELETE** /workload-schemes/{id} | Delete Workload Scheme
*OpenapiClient::WorkloadSchemesApi* | [**get_user_workload_scheme**](docs/WorkloadSchemesApi.md#get_user_workload_scheme) | **GET** /workload-schemes/users/{accountId} | Retrieve Workload Scheme for User
*OpenapiClient::WorkloadSchemesApi* | [**get_workload_scheme_by_id**](docs/WorkloadSchemesApi.md#get_workload_scheme_by_id) | **GET** /workload-schemes/{id} | Retrieve Workload Scheme
*OpenapiClient::WorkloadSchemesApi* | [**get_workload_scheme_members1**](docs/WorkloadSchemesApi.md#get_workload_scheme_members1) | **GET** /workload-schemes/{id}/members | Retrieve Members of Workload Scheme
*OpenapiClient::WorkloadSchemesApi* | [**get_workload_schemes**](docs/WorkloadSchemesApi.md#get_workload_schemes) | **GET** /workload-schemes | Retrieve Workload Schemes
*OpenapiClient::WorkloadSchemesApi* | [**set_default_workload_scheme**](docs/WorkloadSchemesApi.md#set_default_workload_scheme) | **PUT** /workload-schemes/{id}/default | Set default Workload Scheme
*OpenapiClient::WorkloadSchemesApi* | [**set_workload_scheme_for_users**](docs/WorkloadSchemesApi.md#set_workload_scheme_for_users) | **POST** /workload-schemes/{id}/members | Add Users to Workload Scheme
*OpenapiClient::WorkloadSchemesApi* | [**update_workload_scheme**](docs/WorkloadSchemesApi.md#update_workload_scheme) | **PUT** /workload-schemes/{id} | Update Workload Scheme
*OpenapiClient::WorklogsApi* | [**create_work_attribute_values_for_worklogs**](docs/WorklogsApi.md#create_work_attribute_values_for_worklogs) | **POST** /worklogs/work-attribute-values | Bulk create Work Attribute values for Worklogs
*OpenapiClient::WorklogsApi* | [**create_worklog**](docs/WorklogsApi.md#create_worklog) | **POST** /worklogs | Create Worklog
*OpenapiClient::WorklogsApi* | [**delete_worklog**](docs/WorklogsApi.md#delete_worklog) | **DELETE** /worklogs/{id} | Delete Worklog 
*OpenapiClient::WorklogsApi* | [**get_jira_worklog_ids_by_tempo_worklog_ids**](docs/WorklogsApi.md#get_jira_worklog_ids_by_tempo_worklog_ids) | **POST** /worklogs/tempo-to-jira | Retrieve Jira Worklog ids by Tempo Worklog ids
*OpenapiClient::WorklogsApi* | [**get_work_attribute_value_for_worklog**](docs/WorklogsApi.md#get_work_attribute_value_for_worklog) | **GET** /worklogs/{id}/work-attribute-values/{key} | Retrieve Work Attribute value for Worklog
*OpenapiClient::WorklogsApi* | [**get_work_attribute_values_for_worklog**](docs/WorklogsApi.md#get_work_attribute_values_for_worklog) | **GET** /worklogs/{id}/work-attribute-values | Retrieve Work Attribute values for Worklog
*OpenapiClient::WorklogsApi* | [**get_worklog_by_id**](docs/WorklogsApi.md#get_worklog_by_id) | **GET** /worklogs/{id} | Retrieve Worklog
*OpenapiClient::WorklogsApi* | [**get_worklogs**](docs/WorklogsApi.md#get_worklogs) | **GET** /worklogs | Retrieve Worklogs
*OpenapiClient::WorklogsApi* | [**get_worklogs_by_account**](docs/WorklogsApi.md#get_worklogs_by_account) | **GET** /worklogs/account/{accountKey} | Search Worklogs associated to Account
*OpenapiClient::WorklogsApi* | [**get_worklogs_by_issue_id**](docs/WorklogsApi.md#get_worklogs_by_issue_id) | **GET** /worklogs/issue/{issueId} | Search Worklogs associated to Issue id
*OpenapiClient::WorklogsApi* | [**get_worklogs_by_project_id**](docs/WorklogsApi.md#get_worklogs_by_project_id) | **GET** /worklogs/project/{projectId} | Retrieve Worklogs associated to projectId
*OpenapiClient::WorklogsApi* | [**get_worklogs_by_team**](docs/WorklogsApi.md#get_worklogs_by_team) | **GET** /worklogs/team/{teamId} | Search Worklogs associated to Team
*OpenapiClient::WorklogsApi* | [**get_worklogs_by_user**](docs/WorklogsApi.md#get_worklogs_by_user) | **GET** /worklogs/user/{accountId} | Search Worklogs associated to User
*OpenapiClient::WorklogsApi* | [**search_worklogs**](docs/WorklogsApi.md#search_worklogs) | **POST** /worklogs/search | Search Worklogs
*OpenapiClient::WorklogsApi* | [**update_worklog**](docs/WorklogsApi.md#update_worklog) | **PUT** /worklogs/{id} | Update Worklog


## Documentation for Models

 - [OpenapiClient::Account](docs/Account.md)
 - [OpenapiClient::AccountInput](docs/AccountInput.md)
 - [OpenapiClient::AccountLink](docs/AccountLink.md)
 - [OpenapiClient::AccountLinkInput](docs/AccountLinkInput.md)
 - [OpenapiClient::AccountLinkResults](docs/AccountLinkResults.md)
 - [OpenapiClient::AccountLinkScope](docs/AccountLinkScope.md)
 - [OpenapiClient::AccountSearchInput](docs/AccountSearchInput.md)
 - [OpenapiClient::AccountUser](docs/AccountUser.md)
 - [OpenapiClient::Category](docs/Category.md)
 - [OpenapiClient::CategoryInput](docs/CategoryInput.md)
 - [OpenapiClient::CategoryResults](docs/CategoryResults.md)
 - [OpenapiClient::CategoryType](docs/CategoryType.md)
 - [OpenapiClient::CategoryTypeResults](docs/CategoryTypeResults.md)
 - [OpenapiClient::CreateWorkAttributeInput](docs/CreateWorkAttributeInput.md)
 - [OpenapiClient::Customer](docs/Customer.md)
 - [OpenapiClient::CustomerInput](docs/CustomerInput.md)
 - [OpenapiClient::DaySchedule](docs/DaySchedule.md)
 - [OpenapiClient::DayScheduleResults](docs/DayScheduleResults.md)
 - [OpenapiClient::Entity](docs/Entity.md)
 - [OpenapiClient::GenericResource](docs/GenericResource.md)
 - [OpenapiClient::GenericResourceInput](docs/GenericResourceInput.md)
 - [OpenapiClient::GenericResourceReference](docs/GenericResourceReference.md)
 - [OpenapiClient::GenericResourceSearchInput](docs/GenericResourceSearchInput.md)
 - [OpenapiClient::GenericResourceTeamMember](docs/GenericResourceTeamMember.md)
 - [OpenapiClient::GenericResourceTeamMemberInput](docs/GenericResourceTeamMemberInput.md)
 - [OpenapiClient::GenericResourceTeamMembers](docs/GenericResourceTeamMembers.md)
 - [OpenapiClient::GlobalConfiguration](docs/GlobalConfiguration.md)
 - [OpenapiClient::Holiday](docs/Holiday.md)
 - [OpenapiClient::HolidayInput](docs/HolidayInput.md)
 - [OpenapiClient::HolidayResults](docs/HolidayResults.md)
 - [OpenapiClient::HolidayScheme](docs/HolidayScheme.md)
 - [OpenapiClient::HolidaySchemeInputBean](docs/HolidaySchemeInputBean.md)
 - [OpenapiClient::HolidaySchemeMembersInput](docs/HolidaySchemeMembersInput.md)
 - [OpenapiClient::HolidaySchemeResults](docs/HolidaySchemeResults.md)
 - [OpenapiClient::Issue](docs/Issue.md)
 - [OpenapiClient::MembershipInput](docs/MembershipInput.md)
 - [OpenapiClient::ModelSelf](docs/ModelSelf.md)
 - [OpenapiClient::Pageable](docs/Pageable.md)
 - [OpenapiClient::PageableAccount](docs/PageableAccount.md)
 - [OpenapiClient::PageableAccountLink](docs/PageableAccountLink.md)
 - [OpenapiClient::PageableCustomer](docs/PageableCustomer.md)
 - [OpenapiClient::PageableGenericResourceWithoutSelfLink](docs/PageableGenericResourceWithoutSelfLink.md)
 - [OpenapiClient::PageableMetadata](docs/PageableMetadata.md)
 - [OpenapiClient::PageablePermissionRole](docs/PageablePermissionRole.md)
 - [OpenapiClient::PageablePlanWithoutSelfLink](docs/PageablePlanWithoutSelfLink.md)
 - [OpenapiClient::PageableSkill](docs/PageableSkill.md)
 - [OpenapiClient::PageableTeam](docs/PageableTeam.md)
 - [OpenapiClient::PageableTeamLink](docs/PageableTeamLink.md)
 - [OpenapiClient::PageableTempoToJiraWorklogId](docs/PageableTempoToJiraWorklogId.md)
 - [OpenapiClient::PageableUser](docs/PageableUser.md)
 - [OpenapiClient::PageableWithoutSelfLink](docs/PageableWithoutSelfLink.md)
 - [OpenapiClient::PageableWorkAttribute](docs/PageableWorkAttribute.md)
 - [OpenapiClient::PageableWorkloadScheme](docs/PageableWorkloadScheme.md)
 - [OpenapiClient::PageableWorklog](docs/PageableWorklog.md)
 - [OpenapiClient::Permission](docs/Permission.md)
 - [OpenapiClient::PermissionRole](docs/PermissionRole.md)
 - [OpenapiClient::PermissionRoleInput](docs/PermissionRoleInput.md)
 - [OpenapiClient::Plan](docs/Plan.md)
 - [OpenapiClient::PlanApproval](docs/PlanApproval.md)
 - [OpenapiClient::PlanApprovalInput](docs/PlanApprovalInput.md)
 - [OpenapiClient::PlanAssignee](docs/PlanAssignee.md)
 - [OpenapiClient::PlanDay](docs/PlanDay.md)
 - [OpenapiClient::PlanInput](docs/PlanInput.md)
 - [OpenapiClient::PlanItem](docs/PlanItem.md)
 - [OpenapiClient::PlanMetadata](docs/PlanMetadata.md)
 - [OpenapiClient::PlanPeriod](docs/PlanPeriod.md)
 - [OpenapiClient::PlanResults](docs/PlanResults.md)
 - [OpenapiClient::PlanSearchInput](docs/PlanSearchInput.md)
 - [OpenapiClient::PlannedTime](docs/PlannedTime.md)
 - [OpenapiClient::PlannedTimeValuesPlanDay](docs/PlannedTimeValuesPlanDay.md)
 - [OpenapiClient::PlannedTimeValuesPlanPeriod](docs/PlannedTimeValuesPlanPeriod.md)
 - [OpenapiClient::Program](docs/Program.md)
 - [OpenapiClient::ProgramInput](docs/ProgramInput.md)
 - [OpenapiClient::ProgramReference](docs/ProgramReference.md)
 - [OpenapiClient::ProgramResults](docs/ProgramResults.md)
 - [OpenapiClient::ResultsMetadata](docs/ResultsMetadata.md)
 - [OpenapiClient::Role](docs/Role.md)
 - [OpenapiClient::RoleInput](docs/RoleInput.md)
 - [OpenapiClient::RoleReference](docs/RoleReference.md)
 - [OpenapiClient::RoleResults](docs/RoleResults.md)
 - [OpenapiClient::SelfApiBean](docs/SelfApiBean.md)
 - [OpenapiClient::SelfLink](docs/SelfLink.md)
 - [OpenapiClient::SelfListTeamRef](docs/SelfListTeamRef.md)
 - [OpenapiClient::SelfListWorkAttributeValue](docs/SelfListWorkAttributeValue.md)
 - [OpenapiClient::SelfMember](docs/SelfMember.md)
 - [OpenapiClient::Skill](docs/Skill.md)
 - [OpenapiClient::SkillInput](docs/SkillInput.md)
 - [OpenapiClient::SkillsAssignmentInput](docs/SkillsAssignmentInput.md)
 - [OpenapiClient::Team](docs/Team.md)
 - [OpenapiClient::TeamInput](docs/TeamInput.md)
 - [OpenapiClient::TeamLead](docs/TeamLead.md)
 - [OpenapiClient::TeamLink](docs/TeamLink.md)
 - [OpenapiClient::TeamLinkInput](docs/TeamLinkInput.md)
 - [OpenapiClient::TeamLinkResults](docs/TeamLinkResults.md)
 - [OpenapiClient::TeamLinkScope](docs/TeamLinkScope.md)
 - [OpenapiClient::TeamMember](docs/TeamMember.md)
 - [OpenapiClient::TeamMembership](docs/TeamMembership.md)
 - [OpenapiClient::TeamMembershipInput](docs/TeamMembershipInput.md)
 - [OpenapiClient::TeamMembershipResults](docs/TeamMembershipResults.md)
 - [OpenapiClient::TeamRef](docs/TeamRef.md)
 - [OpenapiClient::TeamRefResults](docs/TeamRefResults.md)
 - [OpenapiClient::TeamReference](docs/TeamReference.md)
 - [OpenapiClient::TempoToJiraWorklogId](docs/TempoToJiraWorklogId.md)
 - [OpenapiClient::TempoWorklogIdList](docs/TempoWorklogIdList.md)
 - [OpenapiClient::TimesheetApproval](docs/TimesheetApproval.md)
 - [OpenapiClient::TimesheetApprovalActor](docs/TimesheetApprovalActor.md)
 - [OpenapiClient::TimesheetApprovalAvailableActions](docs/TimesheetApprovalAvailableActions.md)
 - [OpenapiClient::TimesheetApprovalInput](docs/TimesheetApprovalInput.md)
 - [OpenapiClient::TimesheetApprovalPeriod](docs/TimesheetApprovalPeriod.md)
 - [OpenapiClient::TimesheetApprovalPeriodsBean](docs/TimesheetApprovalPeriodsBean.md)
 - [OpenapiClient::TimesheetApprovalResults](docs/TimesheetApprovalResults.md)
 - [OpenapiClient::TimesheetApprovalReviewer](docs/TimesheetApprovalReviewer.md)
 - [OpenapiClient::TimesheetApprovalStatus](docs/TimesheetApprovalStatus.md)
 - [OpenapiClient::TimesheetApprovalUser](docs/TimesheetApprovalUser.md)
 - [OpenapiClient::UpdateWorkAttributeInput](docs/UpdateWorkAttributeInput.md)
 - [OpenapiClient::User](docs/User.md)
 - [OpenapiClient::UserContact](docs/UserContact.md)
 - [OpenapiClient::UserRefBean](docs/UserRefBean.md)
 - [OpenapiClient::UserResults](docs/UserResults.md)
 - [OpenapiClient::WorkAttribute](docs/WorkAttribute.md)
 - [OpenapiClient::WorkAttributeValue](docs/WorkAttributeValue.md)
 - [OpenapiClient::WorkAttributeValueInput](docs/WorkAttributeValueInput.md)
 - [OpenapiClient::WorkAttributeValueResults](docs/WorkAttributeValueResults.md)
 - [OpenapiClient::WorkAttributeValuesInput](docs/WorkAttributeValuesInput.md)
 - [OpenapiClient::WorkloadScheme](docs/WorkloadScheme.md)
 - [OpenapiClient::WorkloadSchemeDay](docs/WorkloadSchemeDay.md)
 - [OpenapiClient::WorkloadSchemeDayInput](docs/WorkloadSchemeDayInput.md)
 - [OpenapiClient::WorkloadSchemeInput](docs/WorkloadSchemeInput.md)
 - [OpenapiClient::WorkloadSchemeMembersInput](docs/WorkloadSchemeMembersInput.md)
 - [OpenapiClient::Worklog](docs/Worklog.md)
 - [OpenapiClient::WorklogInput](docs/WorklogInput.md)
 - [OpenapiClient::WorklogSearchInput](docs/WorklogSearchInput.md)


## Documentation for Authorization

 All endpoints do not require authorization.

