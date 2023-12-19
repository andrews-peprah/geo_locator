# frozen_string_literal: true

require 'grape-swagger'
module GeoLocator
  class Base < Grape::API
    prefix 'api'
    format :json

    mount GeoLocator::V1::Base
  end
end
