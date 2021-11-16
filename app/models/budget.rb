class Budget < ApplicationRecord
  has_many :fixed_cost_budgets
  has_many :fixed_costs, through: :fixed_cost_budgets
  belongs_to :store
  belongs_to :budges_day_ratio
end
