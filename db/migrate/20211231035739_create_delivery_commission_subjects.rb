class CreateDeliveryCommissionSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_commission_subjects do |t|
      t.string :name, null: false
      t.integer :rate,null:false
      t.references :store, null: false, foreign_key: true
      t.timestamps
    end
  end
end
