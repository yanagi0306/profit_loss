class Achievement < ApplicationRecord
  has_many :income
  has_many :food_costs
  has_many :material_costs
  has_many :variable_cost
  belongs_to :store

  validates :store_id, presence: { message: 'としてログインされていません' }
  validates :ymd, presence: true, uniqueness: true
end
