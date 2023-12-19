class UrlResource < ApplicationRecord
  has_one :geo_location, as: :locationable, dependent: :destroy

  validates :url, presence: true, uniqueness: true
end
