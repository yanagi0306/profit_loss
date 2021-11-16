class FixedCost < ApplicationRecord
  has_many :fixed_cost_achievements
  has_many :achievements, through: :fixed_cost_achievements
  has_many :fixed_cost_budgets
  has_many :budgets, through: :fixed_cost_budgets
  belongs_to :budget_day_ratio
end
