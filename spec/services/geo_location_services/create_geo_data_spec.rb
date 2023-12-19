# Add service spec for create_geo_data

require 'rails_helper'

RSpec.describe GeoLocationServices::CreateGeoData do
  describe '#call' do
    before do
      create(:ip_resource)
      create(:url_resource, url: 'www.google.com')
    end
    let(:ip_id) { IpResource.first.id }
    let(:url_id) { UrlResource.first.id }

    context 'when ip address is passed' do
      let(:params) do
        {
          resource_id: ip_id,
          resource_type: 'ip'
        }
      end

      it 'creates a new geo location successfully' do
        expect(described_class.new(params).call).to eq(true)
      end
    end

    context 'when url is passed' do
      let(:params) do
        {
          resource_id: url_id,
          resource_type: 'url'
        }
      end

      it 'creates a new geo location successfully' do
        expect(described_class.new(params).call).to eq(true)
      end
    end

    context 'when invalid resource passed' do
      let(:params) do
        {
          resource_id: 999,
          resource_type: 'url'
        }
      end

      it 'returns a failed response' do
        expect(described_class.new(params).call).to eq(false)
      end
    end

    context 'when no params passed' do
      let(:params) { {} }

      it 'returns a failed response' do
        expect(described_class.new(params).call).to eq(nil)
      end
    end
  end
end
