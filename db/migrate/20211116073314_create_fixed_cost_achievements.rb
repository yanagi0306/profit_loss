class CreateFixedCostAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :fixed_cost_achievements do |t|
      t.references :achievement, null: false, foreign_key: true
      t.references :fixed_cost, null: false, foreign_key: true
      t.timestamps
    end
  end
end
