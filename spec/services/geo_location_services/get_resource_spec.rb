# Create test to check if the resource is created

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeoLocationServices::GetResource do
  describe '#call' do
    let(:ip_geo_location) { create(:geo_location, :ip_resource) }
    let(:url_geo_location) { create(:geo_location, :url_resource) }
    let(:ip) { ip_geo_location.locationable.ip_address }
    let(:url) { url_geo_location.locationable.url }

    context 'when ip address is passed' do
      let(:params) do
        {
          ip: ip
        }
      end

      it 'returns the ip resource successfully' do
        ip_geo_location
        expect(described_class.new(params).call).to eq(ip_geo_location)
      end
    end

    context 'when url is passed' do
      let(:params) do
        {
          url: url
        }
      end

      it 'returns the url resource successfully' do
        url_geo_location
        expect(described_class.new(params).call).to eq(url_geo_location)
      end
    end

    context 'when invalid resource passed' do
      let(:params) do
        {
          url: 'invalid'
        }
      end

      it 'returns a failed response' do
        # expect to raise an error
        expect { described_class.new(params).call }.to raise_error(RuntimeError)
      end
    end
  end
end
