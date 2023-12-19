# Create class for create geo location service
module GeoLocationServices
  class DeleteResource < BaseService
    include ActiveModel::Validations
    attr_reader :ip, :url, :resource

    validates :ip, presence: true, if: -> { url.blank? }
    validates :url, presence: true, if: -> { ip.blank? }

    def call
      return unless valid?

      get_resource
      raise 'Resource not found' if resource.nil?
      raise 'Unable to delete resource' unless resource.destroy!

      {
        message: 'Resource deleted successfully'
      }
    end

    private

    def get_resource
      if ip.present?
        @resource = IpResource.find_by(ip_address: ip)
      elsif url.present?
        @resource = UrlResource.find_by(url: url)
      end
    end
  end
end
