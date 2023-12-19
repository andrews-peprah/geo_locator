require 'rails_helper'

RSpec.describe GeoLocation, type: :model do
  describe 'validations - ip geolocation' do
    subject { create(:geo_location, :ip_resource) }

    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lng) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:continent) }
    it { should validate_presence_of(:locationable) }
  end

  describe 'validations - url geolocation' do
    subject { create(:geo_location, :url_resource) }

    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lng) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:continent) }
    it { should validate_presence_of(:locationable) }
  end

  describe 'associations' do
    it { should belong_to(:locationable) }
  end
end
