require 'faker'

FactoryBot.define do
  factory :opportunity do
    organization
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    initial_date { Faker::Date.in_date_period }
    salary { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
  end
end