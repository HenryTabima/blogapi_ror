FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    published { 
      r = rand(0..1)
      r == 1
    }
    user
  end
end
