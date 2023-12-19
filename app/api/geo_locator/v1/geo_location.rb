# frozen_string_literal: true

module GeoLocator
  module V1
    class GeoLocation < Grape::API
      resource :geo_location do
        desc 'Returns the geo location data based on ip address or url' do
          hidden false
          deprecated false
          is_array false
          produces ['application/json']
          consumes ['application/json']
        end

        params do
          optional :ip, type: String, desc: 'IP Address'
          optional :url, type: String, desc: 'URL'
          mutually_exclusive :ip, :url
        end

        # http://localhost:5000/api/v1/geo_location
        # http://localhost:5000/api/v1/geo_location.json
        post do
        end

        # http://localhost:5000/api/v1/geo_location?url=
        # http://localhost:5000/api/v1/geo_location.json?ip=
        desc 'Returns the geo location data based on ip address or url' do
          hidden false
          deprecated false
          is_array false
          produces ['application/json']
          consumes ['application/json']
        end

        params do
          optional :ip, type: String, desc: 'IP Address'
          optional :url, type: String, desc: 'URL'
          mutually_exclusive :ip, :url
        end

        get do
        end

        # http://localhost:5000/api/v1/geo_location?url=
        # http://localhost:5000/api/v1/geo_location.json?ip=
        desc 'Deletes the geo location data based on ip address or url' do
          hidden false
          deprecated false
          is_array false
          produces ['application/json']
          consumes ['application/json']
        end

        params do
          optional :ip, type: String, desc: 'IP Address'
          optional :url, type: String, desc: 'URL'
          mutually_exclusive :ip, :url
        end

        delete do
        end
      end
    end
  end
end
