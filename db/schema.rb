# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_16_064714) do

  create_table "achievements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "ymd", null: false
    t.integer "sale", default: 0
    t.integer "lunch_sale", default: 0
    t.integer "dinner_sale", default: 0
    t.integer "lunch_number", default: 0
    t.integer "dinner_number", default: 0
    t.integer "interest_income", default: 0
    t.integer "miscellaneous_income", default: 0
    t.integer "food_cost", default: 0
    t.integer "material_cost", default: 0
    t.integer "pert_cost", default: 0
    t.integer "consumption_tax", default: 0
    t.integer "miscellaneous_cost", default: 0
    t.integer "delivery_commission", default: 0
    t.integer "electric", default: 0
    t.integer "water", default: 0
    t.integer "gas", default: 0
    t.integer "power", default: 0
    t.integer "overtime_employee_cost", default: 0
    t.integer "social_insurance_part", default: 0
    t.integer "meeting", default: 0
    t.integer "traveling", default: 0
    t.integer "selling_administration_cost", default: 0
    t.integer "interest_payment", default: 0
    t.integer "communications_variable", default: 0
    t.integer "publicity_variable", default: 0
    t.integer "garbage_variable", default: 0
    t.integer "car_variable", default: 0
    t.integer "credit_variable", default: 0
    t.integer "clean_variable", default: 0
    t.integer "communications_fixed", default: 0
    t.integer "publicity_fixed", default: 0
    t.integer "garbage_fixed", default: 0
    t.integer "car_fixed", default: 0
    t.integer "credit_fixed", default: 0
    t.integer "clean_fixed", default: 0
    t.integer "rent", default: 0
    t.integer "employee_cost", default: 0
    t.integer "director_cost", default: 0
    t.integer "company_interest", default: 0
    t.integer "social_insurance_employee", default: 0
    t.integer "resident_tax", default: 0
    t.integer "pos_system", default: 0
    t.integer "welfare_fixed", default: 0
    t.integer "delivery_fixed", default: 0
    t.integer "borrowing", default: 0
    t.integer "tax_counsellor", default: 0
    t.integer "labor_counsellor", default: 0
    t.bigint "store_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_achievements_on_store_id"
  end

  create_table "budgets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "ymd", null: false
    t.integer "sale", default: 0
    t.integer "lunch_sale", default: 0
    t.integer "dinner_sale", default: 0
    t.integer "lunch_number", default: 0
    t.integer "dinner_number", default: 0
    t.integer "interest_income", default: 0
    t.integer "miscellaneous_income", default: 0
    t.integer "food_cost", default: 0
    t.integer "material_cost", default: 0
    t.integer "pert_cost", default: 0
    t.integer "consumption_tax", default: 0
    t.integer "miscellaneous_cost", default: 0
    t.integer "delivery_commission", default: 0
    t.integer "electric", default: 0
    t.integer "water", default: 0
    t.integer "gas", default: 0
    t.integer "power", default: 0
    t.integer "overtime_employee_cost", default: 0
    t.integer "social_insurance_part", default: 0
    t.integer "meeting", default: 0
    t.integer "traveling", default: 0
    t.integer "selling_administration_cost", default: 0
    t.integer "interest_payment", default: 0
    t.integer "communications_variable", default: 0
    t.integer "publicity_variable", default: 0
    t.integer "garbage_variable", default: 0
    t.integer "car_variable", default: 0
    t.integer "credit_variable", default: 0
    t.integer "clean_variable", default: 0
    t.integer "communications_fixed", default: 0
    t.integer "publicity_fixed", default: 0
    t.integer "garbage_fixed", default: 0
    t.integer "car_fixed", default: 0
    t.integer "credit_fixed", default: 0
    t.integer "clean_fixed", default: 0
    t.integer "rent", default: 0
    t.integer "employee_cost", default: 0
    t.integer "director_cost", default: 0
    t.integer "company_interest", default: 0
    t.integer "social_insurance_employee", default: 0
    t.integer "resident_tax", default: 0
    t.integer "pos_system", default: 0
    t.integer "welfare_fixed", default: 0
    t.integer "delivery_fixed", default: 0
    t.integer "borrowing", default: 0
    t.integer "tax_counsellor", default: 0
    t.integer "labor_counsellor", default: 0
    t.bigint "store_id", null: false
    t.bigint "budgets_day_ratio_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["budgets_day_ratio_id"], name: "index_budgets_on_budgets_day_ratio_id"
    t.index ["store_id"], name: "index_budgets_on_store_id"
  end

  create_table "budgets_day_ratios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "monday", null: false
    t.integer "tuesday", null: false
    t.integer "wednesday", null: false
    t.integer "thursday", null: false
    t.integer "friday", null: false
    t.integer "saturday", null: false
    t.integer "holiday", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_budgets_day_ratios_on_store_id"
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "incomes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "price", default: 0, null: false
    t.date "ymd", null: false
    t.string "income_category_id", null: false
    t.bigint "achievement_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["achievement_id"], name: "index_incomes_on_achievement_id"
    t.index ["store_id"], name: "index_incomes_on_store_id"
  end

  create_table "sales", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "ymd", null: false
    t.integer "sale", default: 0
    t.integer "lunch_sale", default: 0
    t.integer "dinner_sale", default: 0
    t.integer "lunch_number", default: 0
    t.integer "dinner_number", default: 0
    t.bigint "achievement_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["achievement_id"], name: "index_sales_on_achievement_id"
    t.index ["store_id"], name: "index_sales_on_store_id"
  end

  create_table "stores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.integer "opening_year", null: false
    t.bigint "company_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_stores_on_company_id"
    t.index ["email"], name: "index_stores_on_email", unique: true
    t.index ["reset_password_token"], name: "index_stores_on_reset_password_token", unique: true
  end

  create_table "variable_costs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "ymd", null: false
    t.integer "food_cost", default: 0
    t.integer "material_cost", default: 0
    t.integer "pert_cost", default: 0
    t.integer "consumption_tax", default: 0
    t.integer "miscellaneous_cost", default: 0
    t.integer "delivery_commission", default: 0
    t.integer "electric", default: 0
    t.integer "water", default: 0
    t.integer "gas", default: 0
    t.integer "power", default: 0
    t.integer "communications_variable", default: 0
    t.integer "publicity_variable", default: 0
    t.integer "garbage_variable", default: 0
    t.integer "car_variable", default: 0
    t.integer "credit_variable", default: 0
    t.integer "clean_variable", default: 0
    t.integer "overtime_employee_cost", default: 0
    t.integer "social_insurance_part", default: 0
    t.integer "meeting", default: 0
    t.integer "traveling", default: 0
    t.integer "selling_administration_cost", default: 0
    t.integer "interest_payment", default: 0
    t.bigint "achievement_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["achievement_id"], name: "index_variable_costs_on_achievement_id"
    t.index ["store_id"], name: "index_variable_costs_on_store_id"
  end

  add_foreign_key "achievements", "stores"
  add_foreign_key "budgets", "budgets_day_ratios"
  add_foreign_key "budgets", "stores"
  add_foreign_key "budgets_day_ratios", "stores"
  add_foreign_key "incomes", "achievements"
  add_foreign_key "incomes", "stores"
  add_foreign_key "sales", "achievements"
  add_foreign_key "sales", "stores"
  add_foreign_key "stores", "companies"
  add_foreign_key "variable_costs", "achievements"
  add_foreign_key "variable_costs", "stores"
end
