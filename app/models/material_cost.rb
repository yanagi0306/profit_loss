class MaterialCost < ApplicationRecord
  belongs_to :achievement
  belongs_to :material_category

  validate :price, :ymd, presence: { message: 'が未入力です' }
  validates :ymd, uniqueness: true
  validates :achievement_id,
            :material_category_id,
            presence: {
              message: 'と紐付いていません',
            }
end
