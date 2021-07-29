class CreateOpportunities < ActiveRecord::Migration[6.1]
  def change
    create_table :opportunities do |t|
      t.belongs_to :organization, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.date :initial_date
      t.float :salary

      t.timestamps
    end
  end
end
