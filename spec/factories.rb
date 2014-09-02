FactoryGirl.define do 
  factory :category do
  	name {Faker::Lorem.word}
  end

  factory :post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.sentence }
    category
  end
  
end