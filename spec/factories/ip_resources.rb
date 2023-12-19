FactoryBot.define do
  factory :ip_resource do
    ip_address { Faker::Internet.ip_v4_address }
  end
end
