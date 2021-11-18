class BudgetsDayRatio < ApplicationRecord
  has_many :budgets
  has_many :fixed_costs
end
