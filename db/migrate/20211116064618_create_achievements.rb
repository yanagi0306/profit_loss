class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.date :ymd, null: false, unique: true
      t.integer :water
      t.integer :gas
      t.integer :electric
      t.integer :income
      t.integer :sales
      t.integer :lunch_sales
      t.integer :dinner_sales
      t.integer :part_cost
      t.integer :food_cost
      t.integer :other
      t.integer :employee_cost
      t.integer :rent
      t.references :store, foreign_key: true
      t.timestamps
    end
  end
end
