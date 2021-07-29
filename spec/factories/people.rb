require 'faker'

FactoryBot.define do
  factory :person do
    organization
    first_name { Faker::Name.first_name  }
    last_name { Faker::Name.last_name  }
    age { Faker::Number.number(digits: 2) }
    telephone { Faker::PhoneNumber.cell_phone_in_e164 }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
  end
end