class GeoLocation < ApplicationRecord
  belongs_to :locationable, polymorphic: true

  validates :lat, :lng, :city, :country, :continent, :locationable, presence: true
end
