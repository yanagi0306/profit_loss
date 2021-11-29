class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.date :ymd, null: false, unique: true
      t.integer :sale, null: false
      t.integer :lunch_sale, null: false
      t.integer :dinner_sale
      t.references :achievement, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.timestamps
    end
  end
end
