class CreateVariableCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :variable_costs do |t|
      t.date :ymd, null: false, unique: true
      t.integer :overtime_employee_cost, default: 0
      t.integer :social_insurance_part, default: 0
      t.integer :meeting, default: 0
      t.integer :traveling, default: 0
      t.integer :selling_administration_cost, default: 0
      t.integer :interest_payment, default: 0

      t.integer :communications_variable, default: 0
      t.integer :publicity_variable, default: 0
      t.integer :garbage_variable, default: 0
      t.integer :car_variable, default: 0
      t.integer :credit_variable, default: 0
      t.integer :clean_variable, default: 0

      t.integer :electric, default: 0
      t.integer :water, default: 0
      t.integer :gas, default: 0
      t.integer :power, default: 0

      t.integer :food_cost, default: 0
      t.integer :material_cost, default: 0
      t.integer :pert_cost, default: 0
      t.integer :miscellaneous_cost, default: 0
      t.integer :delivery_commission, default: 0

      t.references :achievement, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.timestamps
    end
  end
end
