# Create class for create geo location service
module GeoLocationServices
  class CreateIp < BaseService
    def initialize(params)
      @params = params
    end

    def call
      create_geo_location
    end

    private

    def create_geo_location
      geo_location = GeoLocation.new(@params)
      geo_location.save!
      geo_location
    end
  end
end
