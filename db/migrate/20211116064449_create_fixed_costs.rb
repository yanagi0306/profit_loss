class CreateFixedCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :fixed_costs do |t|
      t.integer :price, null: false
      t.integer :fixed_category_id, null: false
      t.date :start_date, null: false, unique: true
      t.date :end_date, null: false, unique: true
      t.references :budgets_day_ratio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
