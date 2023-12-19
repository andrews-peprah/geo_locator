FactoryBot.define do
  factory :url_resource do
    url { Faker::Internet.url }
  end
end
