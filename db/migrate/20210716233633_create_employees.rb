class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.references :person, null: false, foreign_key: true
      t.string :area
      t.text :description
      t.float :payment_claim

      t.timestamps
    end
  end
end
