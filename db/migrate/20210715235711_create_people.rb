class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.belongs_to :organization, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :telephone
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
