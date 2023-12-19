# write a spec to test the following:
# posting of ip address or url to create a resource

require 'rails_helper'

RSpec.describe 'FetchGeoData', type: :request do
  describe 'GET /api/v1/geo_location' do
    before do
      create(:geo_location, :url_resource)
      create(:geo_location, :ip_resource)
    end

    let (:request_url) { '/api/v1/geo_location' }
    let(:ip_address) { IpResource.first.ip_address }
    let(:url) { UrlResource.first.url }

    context 'when ip address is passed' do
      let(:params) do
        {
          ip: ip_address
        }
      end

      it 'returns a successful response' do
        get request_url, params: params
        expect(response).to have_http_status(:success)
      end
    end

    context 'when url is passed' do
      let(:params) do
        {
          url: url
        }
      end

      it 'returns a successful response' do
        get request_url, params: params
        expect(response).to have_http_status(:success)
      end
    end

    context 'when url and ip address are passed' do
      let(:params) do
        {
          ip: ip_address,
          url: url
        }
      end

      it 'returns a failed response' do
        get request_url, params: params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when url and ip address are not passed' do
      let(:params) do
        {
        }
      end

      it 'returns a failed response' do
        get request_url, params: params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
