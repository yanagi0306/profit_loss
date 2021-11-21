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

ActiveRecord::Schema.define(version: 2021_11_21_111455) do

  create_table "achievements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "ymd", null: false
    t.integer "water"
    t.integer "gas"
    t.integer "electric"
    t.integer "income"
    t.integer "sales"
    t.integer "lunch_sales"
    t.integer "dinner_sales"
    t.integer "part_cost"
    t.integer "food_cost"
    t.integer "other"
    t.integer "employee_cost"
    t.integer "rent"
    t.bigint "store_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_achievements_on_store_id"
  end

  create_table "budgets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "ymd", null: false
    t.integer "water"
    t.integer "gas"
    t.integer "electric"
    t.integer "income"
    t.integer "sales"
    t.integer "lunch_sales"
    t.integer "dinner_sales"
    t.integer "part_cost"
    t.integer "food_cost"
    t.integer "other"
    t.integer "employee_cost"
    t.integer "rent"
    t.bigint "store_id", null: false
    t.bigint "Budgets_day_ratio_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Budgets_day_ratio_id"], name: "index_budgets_on_Budgets_day_ratio_id"
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
    t.bigint "store_id"
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

  create_table "food_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_costs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "price", null: false
    t.date "ymd", null: false
    t.bigint "achievement_id", null: false
    t.bigint "food_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["achievement_id"], name: "index_food_costs_on_achievement_id"
    t.index ["food_category_id"], name: "index_food_costs_on_food_category_id"
  end

  create_table "incomes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "price", null: false
    t.date "ymd", null: false
    t.string "memo"
    t.bigint "achievement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["achievement_id"], name: "index_incomes_on_achievement_id"
  end

  create_table "material_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "material_costs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "price", null: false
    t.date "ymd", null: false
    t.bigint "achievement_id", null: false
    t.bigint "material_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["achievement_id"], name: "index_material_costs_on_achievement_id"
    t.index ["material_category_id"], name: "index_material_costs_on_material_category_id"
  end

  create_table "sales", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "ymd", null: false
    t.integer "price", null: false
    t.integer "lunch_sales", null: false
    t.integer "dinner_sales", null: false
    t.bigint "achievement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["achievement_id"], name: "index_sales_on_achievement_id"
  end

  create_table "stores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
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
    t.integer "price", null: false
    t.integer "variable_category_id", null: false
    t.date "ymd", null: false
    t.bigint "achievement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["achievement_id"], name: "index_variable_costs_on_achievement_id"
  end

  add_foreign_key "achievements", "stores"
  add_foreign_key "budgets", "Budgets_day_ratios"
  add_foreign_key "budgets", "stores"
  add_foreign_key "budgets_day_ratios", "stores"
  add_foreign_key "food_costs", "achievements"
  add_foreign_key "food_costs", "food_categories"
  add_foreign_key "incomes", "achievements"
  add_foreign_key "material_costs", "achievements"
  add_foreign_key "material_costs", "material_categories"
  add_foreign_key "sales", "achievements"
  add_foreign_key "stores", "companies"
  add_foreign_key "variable_costs", "achievements"
end
