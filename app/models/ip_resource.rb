class IpResource < ApplicationRecord
  has_one :geo_location, as: :locationable

  validates :ip_address, presence: true, uniqueness: true
end
