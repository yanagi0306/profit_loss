class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.integer :price, null: false, default: 0
      t.date :ymd, null: false, unique: true

      t.timestamps
    end
  end
end
