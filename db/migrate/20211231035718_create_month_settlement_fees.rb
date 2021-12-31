class CreateMonthSettlementFees < ActiveRecord::Migration[6.0]
  def change
    create_table :month_settlement_fees do |t|
      t.integer :value, null: false
      t.references :settlement_fee_subject, foreign_key: true
      t.references :achievement, foreign_key: true
      t.timestamps
    end
  end
end
