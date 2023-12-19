# Create test to check if the resource is created

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeoLocationServices::CreateResource do
  describe '#call' do
    context 'when ip address is passed' do
      let(:params) do
        {
          type: 'ip',
          value: '123.123.123.123'
        }
      end

      it 'creates a new ip resource successfully' do
        expect { described_class.new(params).call }.to change(IpResource, :count).by(1)
      end
    end

    context 'when url is passed' do
      let(:params) do
        {
          type: 'url',
          value: 'www.google.com'
        }
      end

      it 'creates a new url resource successfully' do
        expect { described_class.new(params).call }.to change(UrlResource, :count).by(1)
      end
    end

    context 'when invalid resource passed' do
      let(:params) do
        {
          type: 'invalid',
          value: 'www.google.com'
        }
      end

      it 'returns a failed response' do
        # expect to raise an error
        expect { described_class.new(params).call }.to raise_error(RuntimeError)
      end
    end
  end
end
