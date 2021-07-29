class CreateGraduations < ActiveRecord::Migration[6.1]
  def change
    create_table :graduations do |t|
      t.references :person, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
