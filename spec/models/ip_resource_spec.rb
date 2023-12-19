require 'rails_helper'

RSpec.describe IpResource, type: :model do
  describe "validations" do
    subject { create(:ip_resource) }

    it { should validate_uniqueness_of(:ip_address) }
    it { should validate_presence_of(:ip_address) }
  end

  describe "associations" do
    it { should have_one(:geo_location) }
  end
end
