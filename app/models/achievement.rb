class Achievement < ApplicationRecord
  has_one :income
  has_many :variable_costs
  has_many :fixed_cost_achievements
  has_many :fixed_cost, through: :fixed_cost_achievements
  has_one :sale
  belongs_to :store
end
