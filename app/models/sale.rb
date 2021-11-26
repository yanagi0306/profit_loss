class Sale < ApplicationRecord
  belongs_to :achievement

  validates :total_price_match?
  validates :ymd, uniqueness: { scope: :achievement_id }
  validate :ymd, presence: { message: 'が未入力です' }
  validates :achievement_id, presence: { message: 'と紐付いていません' }
  validates :price,
            :lunch_sales,
            :dinner_sales,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
            }

  def self.search_getter(year, month, current_store)
    select_month = Date.new(year.to_i, month.to_i)
    first_day = select_month.beginning_of_month
    last_day = first_day + 1.month - 1.day
    month_range = first_day..last_day

    getter = []
    sales = []
    achievements = []
    month_range.each do |day|
      if Achievement.exists?(ymd: day)
        new_achievement =
          Achievement.where(ymd: day, store_id: current_store)[0]
      else
        new_achievement = Achievement.create(ymd: day, store_id: current_store)
      end
      achievements.push(new_achievement)

      new_income =
        Income.new(
          ymd: day,
          achievement_id: new_achievement.id,
          price: 0,
          lunch_sales: 0,
          dinner_sales: 0,
        )
      unless new_income.save
        new_income =
          Income.where(ymd: day, achievement_id: new_achievement.id)[0]
      end
      incomes.push(new_income)
    end
    getter.push(achievements)
    getter.push(incomes)
    return getter
  end
end
