class Category < ApplicationRecord
  has_many :category_relation, through: :category_id
  belongs_to :organization, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
