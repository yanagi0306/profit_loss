class VariableCost < ApplicationRecord

  belongs_to :achievement
  belongs_to :store

  validate :price, :ymd, presence: { message: 'が未入力です' }
  validates :ymd, uniqueness: true
  validates :achievement_id, presence: { message: 'と紐付いていません' }
  validates :variable_category_id, presence: { message: 'が選択されていません' }
  validates :variable_category_id,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 10000000,
              message: 'を選択してください',
            }
end
