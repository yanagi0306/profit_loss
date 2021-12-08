class Achievement < ApplicationRecord
  has_many :incomes
  has_many :variable_costs
  has_many :sales
  belongs_to :store

  validates :store_id, presence: { message: 'としてログインされていません' }
  validates :ymd, presence: true, uniqueness: { scope: :store_id }
end
