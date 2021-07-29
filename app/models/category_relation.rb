class CategoryRelation < ApplicationRecord
  validates_uniqueness_of :category_id, scope: %i[resource_id resource_type]
  belongs_to :resource, polymorphic: true
  belongs_to :organization
  belongs_to :category
end
