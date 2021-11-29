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
              less_than_or_equal_to: 100,
              message: 'は0から10の整数値(半角)を入力してください',
            },
            allow_blank: true
  validates :store_id, presence: { message: 'としてログインされていません' }

  def self.check_params(params,current_store)
    weeks = %i[monday tuesday wednesday thursday friday saturday holiday]
    now_ratio =
      BudgetsDayRatio
        .where(store_id: current_store)
        .order(updated_at: :desc)[
        0
      ]
    weeks.each do |week|
      if params[:budgets_day_ratio][week].to_i == now_ratio[week]
        return false
      end

    end
    return true
  end
end
