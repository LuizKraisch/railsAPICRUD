require 'faker'

FactoryBot.define do
  factory :category do
    organization
    name { Faker::Job.field }
  end
end
