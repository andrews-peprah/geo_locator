# write a spec to test the following:
# posting of ip address or url to create a resource

require 'rails_helper'

RSpec.describe 'CreateGeoData', type: :request do
  describe 'POST /api/v1/geo_location' do
    let(:request_url) { '/api/v1/geo_location' }
    let(:ip_address) { '192.168.3.3' }
    let(:url) { 'www.google.com' }
    context 'when ip address is passed' do

      let(:params) do
        {
          type: 'ip',
          value: ip_address
        }
      end

      it 'returns a successful response' do
        post request_url, params: params
        expect(response).to have_http_status(:success)
      end
    end

    context 'when url is passed' do
      let(:params) do
        {
          type: 'url',
          value: url
        }
      end

      it 'returns a successful response' do
        post request_url, params: params
        expect(response).to have_http_status(:success)
      end
    end

    context 'when url with protocol is passed' do
      let(:url) { 'https://www.google.com' }
      let(:params) do
        {
          type: 'url',
          value: url
        }
      end

      it 'returns a successful response' do
        post request_url, params: params
        expect(response).to have_http_status(:success)
      end
    end

    context 'when invalid type si passed' do
      let(:ip_address) { '192.168.3.3' }
      let(:url) { 'https://www.google.com' }

      let(:params) do
        {
          type: 'invalid',
          value: url
        }
      end

      it 'returns a failed response' do
        post request_url, params: params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
