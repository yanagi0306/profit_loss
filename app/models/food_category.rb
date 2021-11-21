class FoodCategory < ApplicationRecord
  has_many :material_categories

  validates :name, presence: true
  validates :name, uniqueness: true
end
