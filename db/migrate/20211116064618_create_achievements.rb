class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.date :ymd, null: false, unique: true
      t.integer :sale
      t.integer :lunch_sale
      t.integer :dinner_sale
      t.integer :interest_income
      t.integer :miscellaneous_income
      t.integer :overtime_employee_cost
      t.integer :social_insurance_part
      t.integer :communications_variable
      t.integer :publicity_variable
      t.integer :social
      t.integer :meeting
      t.integer :traveling
      t.integer :selling_administration_cost
      t.integer :garbage_variable
      t.integer :car_variable
      t.integer :clean_variable
      t.integer :credit_variable
      t.integer :delivery_variable
      t.integer :electric
      t.integer :water
      t.integer :gas
      t.integer :power
      t.integer :food_cost
      t.integer :material_cost
      t.integer :interest_payment
      t.integer :welfare_fixed
      t.integer :communications_fixed
      t.integer :publicity_fixed
      t.integer :clean_fixed
      t.integer :car_fixed
      t.integer :credit_fixed
      t.integer :delivery_fixed
      t.integer :rent
      t.integer :employee_cost
      t.integer :director_cost
      t.integer :company_interest
      t.integer :social_insurance_employee
      t.integer :resident_tax
      t.integer :pos_system
      t.integer :garbage_fixed
      t.integer :borrowing
      t.integer :tax_counsellor
      t.integer :labor_counsellor
      t.references :store, foreign_key: true
      t.timestamps
    end
  end
end
