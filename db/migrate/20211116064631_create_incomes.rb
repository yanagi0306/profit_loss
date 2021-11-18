class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.integer :price, null: false
      t.date :ymd, null: false, unique: true
      t.string :memo
      t.references :achievement, null: false, foreign_key: true
      t.timestamps
    end
  end
end