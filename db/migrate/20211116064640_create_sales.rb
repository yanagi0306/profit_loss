class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.date :ymd, null: false, unique: true
      t.integer :sale, default: 0
      t.integer :lunch_sale, default: 0
      t.integer :dinner_sale, default: 0
      t.integer :lunch_number,default:0
      t.integer :dinner_number,default:0
      t.integer :lunch_delivery,default:0
      t.integer :dinner_delivery,default:0
      t.references :achievement, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.timestamps
    end
  end
end
