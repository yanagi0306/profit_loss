class CreateSettlementFeeSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :settlement_fee_subjects do |t|
      t.string :name, null: false
      t.integer :rate,null:false
      t.references :store, null: false, foreign_key: true
      t.timestamps
    end
  end
end
