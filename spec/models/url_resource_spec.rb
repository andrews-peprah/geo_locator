require 'rails_helper'

RSpec.describe UrlResource, type: :model do
  describe "validations" do
    subject { create(:url_resource) }

    it { should validate_uniqueness_of(:url) }
    it { should validate_presence_of(:url) }
  end

  describe "associations" do
    it { should have_one(:geo_location) }
  end
end
