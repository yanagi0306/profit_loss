class CreateMonthDeliveryCommissions < ActiveRecord::Migration[6.0]
  def change
    create_table :month_delivery_commissions do |t|
      t.integer :value, null: false
      t.references :delivery_commission_subject, foreign_key: true, index: { name: 'month_delivery_commissions' }
      t.references :achievement, foreign_key: true
      t.timestamps
    end
  end
end
