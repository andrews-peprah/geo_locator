# frozen_string_literal: true

class GeoLocationFetchWorker
  include Sidekiq::Worker
  sidekiq_options retry: 5

  def perform(type, id)
    GeoLocationServices::CreateGeoData.call(resource_type: type, resource_id: id)
  end
end
