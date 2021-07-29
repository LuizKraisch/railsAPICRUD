require 'faker'

FactoryBot.define do
  factory :organziation do
    name { Faker::Company.name }
    cnpj { Faker::Company.unique.brazilian_company_number }
    org_type { Faker::Company.type }
    num_employees { Faker::Number.number(digits: 2) }
    area { Faker::Job.field }
    city { Faker::Address.city }
    state { Faker::Address.state }
  end
end