# frozen_string_literal: true

# Authentication required resources
module GeoLocator
  module V1
    class AuthBase < Grape::API
      v2_auth_malformed = proc {|_raw_token, _app| [400, {}, ['Malformed!']] }
      v2_auth_failed = proc {|_token, _app|  [401, {}, ['Access Denied']] }

      # Enable JWT authentication on this API
      include Grape::Jwt::Authentication
      auth(:jwt, malformed: v2_auth_malformed,
                 failed: v2_auth_failed) do |token|
        result = JwtAuthenticator.validate(token)
        true
      end
    end
  end
end
