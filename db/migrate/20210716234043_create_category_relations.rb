class CreateCategoryRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :category_relations do |t|
      t.references :resource, polymorphic: true
      t.references :category

      t.timestamps
    end
  end
end

# resource_type: "Person", "Opportunity", "Graduation", etc...
# resource_id: ID do model especificado acima.
# category_id: ID da categoria que pertence o model.