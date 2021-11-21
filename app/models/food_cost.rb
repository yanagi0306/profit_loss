class FoodCost < ApplicationRecord
  belongs_to :achievement
  belongs_to :food_category

  validate :price, :ymd, presence: { message: 'が未入力です' }
  validates :ymd, uniqueness: true
  validates :achievement_id,
            :food_category_id,
            presence: {
              message: 'と紐付いていません',
            }
end
