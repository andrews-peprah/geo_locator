# This class calls IPStack API to get the location of a given IP address.
# It is used to get the location of the IP address of the user who is
# creating a new account.
class GeoDataClient
  def self.get_location(resource)
    raise 'IPSTACK_API_KEY not set' unless ENV['IPSTACK_API_KEY']
    raise 'Resource not set' unless resource

    api_key = ENV['IPSTACK_API_KEY']
    response = HTTParty.get("http://api.ipstack.com/#{resource}?access_key=#{api_key}")
    if response.code != 200
      raise "Error getting location data for #{resource}"
    end

    pp response
    data = JSON.parse(response.body)
    {
      city: data['city'],
      state: data['region_name'],
      country: data['country_name'],
      continent: data['continent_name'],
      latitude: data['latitude'],
      longitude: data['longitude']
    }
  end
end
