class Budget < ApplicationRecord
  belongs_to :store
  belongs_to :budges_day_ratio

  validates :store_id, presence: { message: 'としてログインされていません' }
  validates :ymd, presence: true, uniqueness: true
end
