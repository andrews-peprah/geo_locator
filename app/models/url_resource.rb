class UrlResource < ApplicationRecord
  has_one :geo_location, as: :locationable

  validates :url, presence: true, uniqueness: true
end
