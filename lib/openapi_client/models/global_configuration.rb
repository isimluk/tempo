=begin
#REST API documentation

#<p>Base Path: https://api.tempo.io/4</p> <div style=\"background-color: #E5F9FD;padding: 15px;margin: 20px 0;\">   This documentation is for <strong>version 4</strong> of the Tempo REST API, which is the latest version. To read documentation for version 3 of the Tempo REST API, <a href=\"https://apidocs.tempo.io/v3\"><strong>click here</strong></a>  </div>  We encourage you to join our developer community on Slack at [www.tempo.io/developers](https://www.tempo.io/developers), where you can get support from our internal experts and share best practices with other developers building with Tempo.  If you have feedback or requests, you can also reach us through our Customer Support Portal. You can find general product  information in the Tempo Help Center.  Below are links to other Tempo APIs. <ul>   <li><a href=\"https://apidocs.tempo.io/audit\">Audit API</a></li>   <li><a href=\"https://apidocs.tempo.io/cost-tracker\">Cost-Tracker API</a></li>   <li><a href=\"https://apidocs.tempo.io/jira\">Jira Links API</a></li> </ul>  ## Authentication ### Using the REST API as an individual user  You can use the REST API to interact with the data your permissions give you access to. To do so, you will need to  generate a Tempo OAuth 2.0 token.  Go to **Tempo>Settings**, scroll down to **Data Access** and select **API integration**.  Once you have a token, you need to use it inside the Authorization HTTP header. Ex:  `curl -v -H \"Authorization: Bearer $token\" \"https://api.tempo.io/4/worklogs?...\"`<br><br>  ### Using the REST API as an application developer  If you are building apps with Tempo, and have the required Tempo administrator permissions, you can quickly  obtain the OAuth 2.0 credentials you need to retrieve an access token. Access tokens grant temporary, secure  access to Tempo, based on your current permissions.  #### Obtain your credentials  Go to **Tempo>Settings**, scroll down to **Data Access** and select **OAuth 2.0 authentication**.  Enter a Redirect URI and specify the Client type and Authorization grant type. In most cases you will choose Authorization code as the Authorization grant type.  Once you click **Add**, your Client ID and Client secret are generated and you can retrieve your access token.<br><br>  ### How to retrieve an access token for a user #### Authorization grant type used is *authorization_code* ##### Step 1 Obtain an authorization code against your Jira Cloud instance :  `GET: https://{jira-cloud-instance-name}.atlassian.net/plugins/servlet/ac/io.tempo.jira/oauth-authorize/?client_id=$CLIENT_ID&redirect_uri=$REDIRECT_URI`  Where *$CLIENT_ID* and *$REDIRECT_URI* match the one you generated in **Tempo > Settings > OAuth 2.0 Applications**  You will be asked to *authorize* or *deny* access to your Tempo data. Granting access redirects you to the configured  *redirect URI* with a new query string parameter named *code* (this is the authorization code). Note that this authorization code  expires quickly.  ![MyApp Request Access](myapp-request-access.png \"MyApp Request Access\")  ##### Step 2 Obtain an access token from Tempo by providing the *authorization code* to:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"authorization_code\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI code = $CODE ```  The response includes the access token itself, related information, and a refresh token. ```JSON {   \"access_token\":\"$ACCESS_TOKEN\",   \"expires_in\":5184000,   \"token_type\":\"Bearer\",   \"scope\":\"read write\",   \"refresh_token\":\"$REFRESH_TOKEN\" } ```  ##### Step 3 Provide this *access token* to any API requests using the *Authorization header* :  `curl -H \"Authorization: Bearer $ACCESS_TOKEN\" \"https://api.tempo.io/4/worklogs?from=2022-01-28&to=2022-02-03\"`  The access token will expire after the number of seconds specified in the **expires_in** field and will  no longer be usable.  ### How to retrieve a new access token from the refresh token The *access token* will eventually expire. You need to renew it using the previously received *refresh token*:  `POST: https://api.tempo.io/oauth/token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` grant_type = \"refresh_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET redirect_uri = $REDIRECT_URI refresh_token = $REFRESH_TOKEN ```  The response will contain a new *access token* and a new *refresh token*. You'll need to utilize these  new tokens for future calls, as the previous ones will no longer be valid.  ### How to revoke a token You can revoke an existing *access token* at any time:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` token_type_hint = \"access_token\" client_id = $CLIENT_ID client_secret = $CLIENT_SECRET token = $ACCESS_TOKEN ```  You can also revoke an existing *refresh token*:  `POST: https://api.tempo.io/oauth/revoke_token/`  sending the following parameters using the \"application/x-www-form-urlencoded\" format: ``` {   token_type_hint = \"refresh_token\"   client_id = $CLIENT_ID   client_secret = $CLIENT_SECRET   token = $REFRESH_TOKEN } ```  ## API conventions ### Identifying users The Tempo REST API uses the Atlassian accountId to identify users. The accountId is an opaque identifier that  uniquely identifies the user.  The accountId of the current user can found using the [Jira Myself API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-Myself).  Information about a user, given the accountId, can be retrieved using the [Jira User API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/#api-group-User).  ### Dates The API uses strings to represent dates. Dates are formatted as [ISO 8601 calendar dates](https://en.wikipedia.org/wiki/ISO_8601#Calendar_dates) (YYYY-MM-DD).  For example, March 29th, 2019 is formatted as 2019-03-29.  ### Delete requests On success, delete requests return a response with status code [204 (No content)](https://httpstatuses.com/204).  No payload body is included in the response.  ### Arrays A few endpoints accept query parameters of type array. That is achieved by repeating the parameter multiple  times, e.g. to get worklogs from three projects:  `.../worklogs?from=2020-01-01&to=2020-12-31&project=10100&project=10200&project=10300`  ## Errors  The API uses standard HTTP status codes to indicate the success or failure of the API call.  Here are a list of different types of error responses  Status code  | Description | Content type ----------------|-------------|--------- 400 | Bad Request | application/json 401 | Unauthorized | text/html 403 | Forbidden | text/html 404 | Not Found | application/json  <br>  The body of the JSON response will be in the following format:  ``` {   \"errors\": {     \"message\": \"Error details\"   } } ```  An example of 400 error ```   {     \"errors\": {       \"message\": \"'date' must be valid on the format: 'yyyy-MM-dd'\"     }   } ```  An example of 404 error ```   {     \"errors\": {       \"message\": \"Account 'xyz' not found\"     }   } ``` 

The version of the OpenAPI document: 4.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.5.0-SNAPSHOT

=end

require 'date'
require 'time'

module OpenapiClient
  class GlobalConfiguration
    # Boolean to inform if it is possible to login on closed account
    attr_accessor :allow_logging_on_closed_account

    # Shows if Timesheet approval periods are weekly or monthly.
    attr_accessor :approval_period

    # Shows the start day. 1 is monday, 7 is sunday.
    attr_accessor :approval_week_start

    # The max hours a user can work
    attr_accessor :max_hours_per_day_per_user

    # Shows how many days you can track time into the future.
    attr_accessor :number_of_days_allowed_into_future

    # Boolean to inform if planning approval is enabled
    attr_accessor :plan_approval_enabled

    # Shows if remaining estimate is required when tracking time.
    attr_accessor :remaining_estimate_optional

    # Boolean to inform if start and end times should be used for logging time
    attr_accessor :start_and_end_times_enabled

    # Boolean to inform if start and end times should be used for planning time
    attr_accessor :start_and_end_times_for_planning_enabled

    # 1 is monday, 7 is sunday
    attr_accessor :week_start

    # Shows if description is required when tracking time.
    attr_accessor :worklog_description_optional

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'allow_logging_on_closed_account' => :'allowLoggingOnClosedAccount',
        :'approval_period' => :'approvalPeriod',
        :'approval_week_start' => :'approvalWeekStart',
        :'max_hours_per_day_per_user' => :'maxHoursPerDayPerUser',
        :'number_of_days_allowed_into_future' => :'numberOfDaysAllowedIntoFuture',
        :'plan_approval_enabled' => :'planApprovalEnabled',
        :'remaining_estimate_optional' => :'remainingEstimateOptional',
        :'start_and_end_times_enabled' => :'startAndEndTimesEnabled',
        :'start_and_end_times_for_planning_enabled' => :'startAndEndTimesForPlanningEnabled',
        :'week_start' => :'weekStart',
        :'worklog_description_optional' => :'worklogDescriptionOptional'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'allow_logging_on_closed_account' => :'Boolean',
        :'approval_period' => :'String',
        :'approval_week_start' => :'Integer',
        :'max_hours_per_day_per_user' => :'Integer',
        :'number_of_days_allowed_into_future' => :'Integer',
        :'plan_approval_enabled' => :'Boolean',
        :'remaining_estimate_optional' => :'Boolean',
        :'start_and_end_times_enabled' => :'Boolean',
        :'start_and_end_times_for_planning_enabled' => :'Boolean',
        :'week_start' => :'Integer',
        :'worklog_description_optional' => :'Boolean'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `OpenapiClient::GlobalConfiguration` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `OpenapiClient::GlobalConfiguration`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'allow_logging_on_closed_account')
        self.allow_logging_on_closed_account = attributes[:'allow_logging_on_closed_account']
      end

      if attributes.key?(:'approval_period')
        self.approval_period = attributes[:'approval_period']
      end

      if attributes.key?(:'approval_week_start')
        self.approval_week_start = attributes[:'approval_week_start']
      end

      if attributes.key?(:'max_hours_per_day_per_user')
        self.max_hours_per_day_per_user = attributes[:'max_hours_per_day_per_user']
      end

      if attributes.key?(:'number_of_days_allowed_into_future')
        self.number_of_days_allowed_into_future = attributes[:'number_of_days_allowed_into_future']
      end

      if attributes.key?(:'plan_approval_enabled')
        self.plan_approval_enabled = attributes[:'plan_approval_enabled']
      end

      if attributes.key?(:'remaining_estimate_optional')
        self.remaining_estimate_optional = attributes[:'remaining_estimate_optional']
      end

      if attributes.key?(:'start_and_end_times_enabled')
        self.start_and_end_times_enabled = attributes[:'start_and_end_times_enabled']
      end

      if attributes.key?(:'start_and_end_times_for_planning_enabled')
        self.start_and_end_times_for_planning_enabled = attributes[:'start_and_end_times_for_planning_enabled']
      end

      if attributes.key?(:'week_start')
        self.week_start = attributes[:'week_start']
      end

      if attributes.key?(:'worklog_description_optional')
        self.worklog_description_optional = attributes[:'worklog_description_optional']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @allow_logging_on_closed_account.nil?
        invalid_properties.push('invalid value for "allow_logging_on_closed_account", allow_logging_on_closed_account cannot be nil.')
      end

      if @approval_period.nil?
        invalid_properties.push('invalid value for "approval_period", approval_period cannot be nil.')
      end

      if @approval_week_start.nil?
        invalid_properties.push('invalid value for "approval_week_start", approval_week_start cannot be nil.')
      end

      if @number_of_days_allowed_into_future.nil?
        invalid_properties.push('invalid value for "number_of_days_allowed_into_future", number_of_days_allowed_into_future cannot be nil.')
      end

      if @plan_approval_enabled.nil?
        invalid_properties.push('invalid value for "plan_approval_enabled", plan_approval_enabled cannot be nil.')
      end

      if @remaining_estimate_optional.nil?
        invalid_properties.push('invalid value for "remaining_estimate_optional", remaining_estimate_optional cannot be nil.')
      end

      if @start_and_end_times_enabled.nil?
        invalid_properties.push('invalid value for "start_and_end_times_enabled", start_and_end_times_enabled cannot be nil.')
      end

      if @start_and_end_times_for_planning_enabled.nil?
        invalid_properties.push('invalid value for "start_and_end_times_for_planning_enabled", start_and_end_times_for_planning_enabled cannot be nil.')
      end

      if @week_start.nil?
        invalid_properties.push('invalid value for "week_start", week_start cannot be nil.')
      end

      if @worklog_description_optional.nil?
        invalid_properties.push('invalid value for "worklog_description_optional", worklog_description_optional cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @allow_logging_on_closed_account.nil?
      return false if @approval_period.nil?
      approval_period_validator = EnumAttributeValidator.new('String', ["WEEK", "MONTH"])
      return false unless approval_period_validator.valid?(@approval_period)
      return false if @approval_week_start.nil?
      return false if @number_of_days_allowed_into_future.nil?
      return false if @plan_approval_enabled.nil?
      return false if @remaining_estimate_optional.nil?
      return false if @start_and_end_times_enabled.nil?
      return false if @start_and_end_times_for_planning_enabled.nil?
      return false if @week_start.nil?
      return false if @worklog_description_optional.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] approval_period Object to be assigned
    def approval_period=(approval_period)
      validator = EnumAttributeValidator.new('String', ["WEEK", "MONTH"])
      unless validator.valid?(approval_period)
        fail ArgumentError, "invalid value for \"approval_period\", must be one of #{validator.allowable_values}."
      end
      @approval_period = approval_period
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          allow_logging_on_closed_account == o.allow_logging_on_closed_account &&
          approval_period == o.approval_period &&
          approval_week_start == o.approval_week_start &&
          max_hours_per_day_per_user == o.max_hours_per_day_per_user &&
          number_of_days_allowed_into_future == o.number_of_days_allowed_into_future &&
          plan_approval_enabled == o.plan_approval_enabled &&
          remaining_estimate_optional == o.remaining_estimate_optional &&
          start_and_end_times_enabled == o.start_and_end_times_enabled &&
          start_and_end_times_for_planning_enabled == o.start_and_end_times_for_planning_enabled &&
          week_start == o.week_start &&
          worklog_description_optional == o.worklog_description_optional
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [allow_logging_on_closed_account, approval_period, approval_week_start, max_hours_per_day_per_user, number_of_days_allowed_into_future, plan_approval_enabled, remaining_estimate_optional, start_and_end_times_enabled, start_and_end_times_for_planning_enabled, week_start, worklog_description_optional].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = OpenapiClient.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
