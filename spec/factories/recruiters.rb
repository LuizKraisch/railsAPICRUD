require 'faker'

FactoryBot.define do
  factory :recruiter do
    person
    organization
    area { Faker::Job.field }
    description { Faker::Job.title }
  end
end
