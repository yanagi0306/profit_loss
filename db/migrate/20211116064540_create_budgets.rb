class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.date :ymd, null: false, unique: true
      t.integer :water
      t.integer :gas
      t.integer :electric
      t.integer :rent
      t.integer :income
      t.integer :sales
      t.integer :lunch_sales
      t.integer :dinner_sales
      t.integer :part_cost
      t.integer :employee_cost
      t.integer :food_cost
      t.integer :other

      t.references :store, type: :bigint, null: false, foreign_key: true
      t.references :Budgets_day_ratio,
                   type: :bigint,
                   null: false,
                   foreign_key: true
      t.timestamps
    end
  end
end
