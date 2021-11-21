class CreateFoodCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :food_costs do |t|
      t.integer :price, null: false
      t.date :ymd, null: false
      t.references :achievement, null: false, foreign_key: true
      t.references :food_category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
