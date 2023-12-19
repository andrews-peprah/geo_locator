# Create class for geo location service
module GeoLocationServices
  class CreateGeoData < BaseService
    include ActiveModel::Validations

    attr_reader :resource, :resource_id, :resource_type

    validates :resource_type, presence: true, inclusion: { in: %w[ip url] }
    validates :resource_id, presence: true

    def call
      return unless valid?

      find_resource
      return if resource.nil?

      create_geo_location(::GeoDataClient.get_location(resource_value))
    end

    private

    def find_resource
      case resource_type
      when 'ip'
        @resource = IpResource.find_by(id: resource_id)
      when 'url'
        @resource = UrlResource.find_by(id: resource_id)
      else
        errors.add(:resource_type, 'is invalid')
      end
    end

    def resource_value
      case resource_type
      when 'ip'  then resource.ip_address
      when 'url' then resource.url
      end
    end

    def create_geo_location(data)
      raise 'Invalid geo data' if data.blank?

      attrs = {
        city: data[:city],
        country: data[:country],
        continent: data[:continent],
        lat: data[:latitude],
        lng: data[:longitude]
      }
      geo_location = GeoLocation.new(attrs)
      geo_location.locationable = resource
      geo_location.save!
    end
  end
end
