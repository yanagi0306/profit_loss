class CreateDayDeliveryCommissions < ActiveRecord::Migration[6.0]
  def change
    create_table :day_delivery_commissions do |t|
      t.integer :value, null: false
      t.references :delivery_commission_subject, foreign_key: true
      t.references :achievement, foreign_key: true
      t.timestamps
    end
  end
end
