class Person < ApplicationRecord
  belongs_to :organization
  has_many :graduations
end
