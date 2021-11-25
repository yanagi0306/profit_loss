class CreateBudgetsDayRatios < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets_day_ratios do |t|
      t.integer :monday, null: false
      t.integer :tuesday, null: false
      t.integer :wednesday, null: false
      t.integer :thursday, null: false
      t.integer :friday, null: false
      t.integer :saturday, null: false
      t.integer :holiday, null: false
      t.references :store, null: false, foreign_key: true
      t.timestamps
    end
  end
end
