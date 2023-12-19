# frozen_string_literal: true

module GeoLocator
  module V1
    class HealthCheck < Grape::API
      resource :health_check do
        desc 'Returns json to check system functionality' do
          hidden false
          deprecated false
          is_array false
          produces ['application/json']
          consumes ['application/json']
        end

        # http://localhost:5000/api/v1/health_check
        # http://localhost:5000/api/v1/health_check.json
        get '', root: :health_check do
          return {status: 200, message: 'System functional'}
        end
      end
    end
  end
end
