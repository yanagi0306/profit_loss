class Budget < ApplicationRecord
  belongs_to :store
  belongs_to :budgets_day_ratio

  validates :budgets_day_ratio_id, presence: true
  validates :store_id, presence: true
  validates :ymd,
  presence: true,
  uniqueness: {
    scope: %i[store_id]}
end
