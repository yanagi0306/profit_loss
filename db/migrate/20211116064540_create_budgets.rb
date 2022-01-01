class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.date :ymd, null: false
      t.integer :sale, default: 0
      t.integer :lunch_sale, default: 0
      t.integer :dinner_sale, default: 0
      t.integer :lunch_number,default:0
      t.integer :dinner_number,default:0
      t.integer :interest_income, default: 0
      t.integer :miscellaneous_income, default: 0

      t.integer :welfare, default: 0
      t.integer :company_interest, default: 0
      t.integer :resident_tax, default: 0

      t.integer :settlement_fee, default: 0
      t.integer :delivery_commission, default: 0

      t.integer :overtime_employee_cost, default: 0
      t.integer :employee_cost, default: 0
      t.integer :director_cost, default: 0
      t.integer :traveling, default: 0

      t.integer :meeting, default: 0
      t.integer :interest_payment, default: 0
      t.integer :rent, default: 0
      t.integer :system, default: 0
      t.integer :borrowing, default: 0
      t.integer :tax_counsellor, default: 0
      t.integer :labor_counsellor, default: 0

      t.integer :electric, default: 0
      t.integer :water, default: 0
      t.integer :gas, default: 0
      t.integer :power, default: 0

      t.integer :food_cost, default: 0
      t.integer :material_cost, default: 0
      t.integer :pert_cost, default: 0
      t.integer :miscellaneous_cost, default: 0

      t.integer :communications_add, default: 0
      t.integer :publicity_add, default: 0
      t.integer :garbage_add, default: 0
      t.integer :clean_add, default: 0

      t.integer :communications_fixed , default: 0
      t.integer :publicity_fixed , default: 0
      t.integer :garbage_fixed , default: 0
      t.integer :clean_fixed , default: 0
      t.integer :welfare_add, default: 0

      t.references :store, type: :bigint, null: false, foreign_key: true
      t.references :budgets_day_ratio, null: false, foreign_key: true
      t.timestamps
    end
  end
end
