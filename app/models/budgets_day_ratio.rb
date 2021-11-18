class BudgetsDayRatio < ApplicationRecord
  has_many :budgets
  belongs_to :store
  validates :monday,
            :tuesday,
            :wednesday,
            :thursday,
            :friday,
            :saturday,
            :holiday,
            presence: {
              message: 'の比率が入力されていません',
            }
  validates :monday,
            :tuesday,
            :wednesday,
            :thursday,
            :friday,
            :saturday,
            :holiday,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 1000,
              message: 'は0から1000の整数値(半角)を入力してください',
            },
            allow_blank: true
  validates :store_id, presence: { message: 'としてログインされていません' }
end
