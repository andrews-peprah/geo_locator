# Create class for create geo location service
module GeoLocationServices
  class CreateResource < BaseService
    include ActiveModel::Validations
    attr_reader :type, :value
    attr_accessor :resource

    validates :type, presence: true, inclusion: { in: %w[ip url] }
    validates :value, presence: true

    def call
      case type
      when 'ip'
        create_ip_resource
      when 'url'
        create_url_resource
      else
        raise 'Invalid type'
      end

      # Schedule a job to get geo location data
      GeoLocationFetchWorker.perform_async(type, resource.id)
      resource
    end

    private

    def create_ip_resource
      validate_ip_address
      @resource = IpResource.create!(ip_address: value)
    end

    def create_url_resource
      validate_domain
      @resource = UrlResource.create!(url: value)
    end

    def validate_ip_address
      raise 'Invalid IP Address' unless value =~ Resolv::IPv4::Regex || value =~ Resolv::IPv6::Regex
    end

    def validate_domain
      @value = value.gsub(/(https?:\/\/)/, '')
      regex = /^[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}$/
      raise 'Invalid url' unless regex.match?(value)
    end
  end
end
