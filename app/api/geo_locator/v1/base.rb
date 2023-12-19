# frozen_string_literal: true

module GeoLocator
  module V1
    class Base < Grape::API
      include GeoLocator::V1::Defaults

      # Endpoint resources
      mount GeoLocator::V1::HealthCheck
      mount GeoLocator::V1::GeoLocation

      # http://localhost:5000/api/v1/swagger_doc
      add_swagger_documentation(
        title: 'GeoLocator',
        api_version: 'api/v1',
        hide_documentation_path: true,
        hide_format: true,
        mount_path: '/swagger_doc'
      )
    end
  end
end
