class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :cnpj
      t.string :org_type
      t.integer :num_employees
      t.string :area
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
