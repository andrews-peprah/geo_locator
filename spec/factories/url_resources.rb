FactoryBot.define do
  factory :url_resource do
    url { Faker::Internet.domain_name }
  end
end
