require 'faker'

FactoryBot.define do
  factory :graduation do
    person
    sequence(:title) { |n| "graduation_#{n}" }
    sequence(:description) { |n| "description_#{n}" }
  end
end
