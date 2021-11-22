class Income < ApplicationRecord
  belongs_to :achievement
  belongs_to :income_category

  validate :price, :ymd, presence: { message: 'が未入力です' }
  validates :ymd, uniqueness: true
  validates :achievement_id, presence: { message: 'と紐付いていません' }
  validates :income_category_id, presence: { message: 'が選択されていません' }
  validates :income_category_id,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 2,
              message: 'を選択してください',
            }

  def date_today
    @now = Date.today
    @wday = %w[月 火 水 木 金 土 日]
    @this_year = @now.year
    @this_month = @now.month
    @year_range = current_store.opening_year..@this_year
    @first_day = @now.beginning_of_month
    @last_day = (@first_day + (7 - @first_day.wday))
    @week_period = (@first_day..@last_day)
  end
end
