class CreateVariableCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :variable_costs do |t|
      t.integer :price, null: false
      t.integer :variable_category_id, null: false
      t.date :ymd, null: false
      t.references :achievement, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.timestamps
    end
  end
end
