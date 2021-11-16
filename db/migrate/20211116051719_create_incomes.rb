class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.integer :price, null: false
      t.date :ymd, null: false, unique: true
      t.references :store, type: :bigint, null: false, foreign_key: true
      t.string :memo
      t.timestamps
    end
  end
end
