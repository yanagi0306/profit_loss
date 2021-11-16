class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.date :ymd, null: false, unique: true
      t.integer :price, null: false
      t.integer :lunch_sales, null: false
      t.integer :dinner_sales, null: false

      t.references :achievement, type: :bigint, null: false, foreign_key: true
      t.timestamps
    end
  end
end
