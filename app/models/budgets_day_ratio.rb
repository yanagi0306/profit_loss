class BudgetsDayRatio < ApplicationRecord
  has_many :budgets
  belongs_to :store
end
