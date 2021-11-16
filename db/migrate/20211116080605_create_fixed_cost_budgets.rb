class CreateFixedCostBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :fixed_cost_budgets do |t|
      t.references :budget, null: false, foreign_key: true
      t.references :fixed_cost, null: false, foreign_key: true
      t.timestamps
    end
  end
end
