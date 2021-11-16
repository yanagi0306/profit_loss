class Budget < ApplicationRecord
  belongs_to :store
  belongs_to :budgets_day_ratio
end
