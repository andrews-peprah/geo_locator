FactoryBot.define do
  factory :geo_location do
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    city { Faker::Address.city }
    country { Faker::Address.country }
    continent { ['Europe', 'Asia', 'Africa', 'North America', 'South America', 'Antarctica', 'Australia'].sample }

    trait :url_resource do
      association :locationable, factory: :url_resource
    end

    trait :ip_resource do
      association :locationable, factory: :ip_resource
    end
  end
end
