class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.integer :price, null: false, default: 0
      t.date :ymd, null: false, unique: true
      t.string :income_category_id, null: false
      t.references :achievement, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.timestamps
    end
  end
end
