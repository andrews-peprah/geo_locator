class IpResource < ApplicationRecord
  has_one :geo_location, as: :locationable, dependent: :destroy

  validates :ip_address, presence: true, uniqueness: true
end
