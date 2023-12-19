# Create test to check if the resource is created

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeoLocationServices::DeleteResource do
  describe '#call' do
    let(:ip) { '123.123.123.123' }
    let(:url) { 'www.google.com' }
    let(:ip_resource) { create(:ip_resource, ip_address: ip) }
    let(:url_resource) { create(:url_resource, url: url) }

    context 'when ip address is passed' do
      let(:params) do
        {
          ip: ip
        }
      end

      it 'deletes the ip resource successfully' do
        ip_resource
        expect { described_class.new(params).call }.to change(IpResource, :count).by(-1)
      end
    end

    context 'when url is passed' do
      let(:params) do
        {
          url: url
        }
      end

      it 'deletes the url resource successfully' do
        url_resource
        expect { described_class.new(params).call }.to change(UrlResource, :count).by(-1)
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
