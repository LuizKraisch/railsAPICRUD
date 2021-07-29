require 'faker'

FactoryBot.define do
  factory :employee do
    person
    area { Faker::Job.field }
    description { Faker::Job.title }
    payment_claim { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
  end
end
