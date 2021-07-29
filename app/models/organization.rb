class Organization < ApplicationRecord
  has_many :people, dependent: :destroy
  has_many :opportunities, dependent: :destroy
  has_many :recruiters, dependent: :destroy
  has_many :categories, dependent: :destroy
end
