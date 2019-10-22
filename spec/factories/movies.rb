FactoryGirl.define do
    factory :movie do
        title Faker::Lorem.sentence
        director Faker::Name.name
        rating Faker::Lorem.word
        release_date Faker::Date.backward(14)
    end
end