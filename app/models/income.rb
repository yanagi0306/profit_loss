class Income < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :achievement
  belongs_to :income_category

  validates :ymd, presence: true, uniqueness: { scope: :income_category_id }
  validates :achievement_id, presence: { message: 'と紐付いていません' }
  validates :income_category_id, presence: { message: 'が選択されていません' }
  validates :income_category_id,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 2,
              message: 'を選択してください',
            }
  validates :price,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
            }

  def self.search_getter(year, month, current_store)
    select_month = Date.new(year.to_i, month.to_i)
    first_day = select_month.beginning_of_month
    last_day = first_day + 1.month - 1.day
    month_range = first_day..last_day
    category_ids = IncomeCategory.data.map { |i| i[:id] }
    getter = []
    incomes = []
    achievements = []
    month_range.each do |day|
      day_incomes = []
      if Achievement.exists?(ymd: day)
        new_achievement =
          Achievement.where(ymd: day, store_id: current_store)[0]
      else
        new_achievement = Achievement.create(ymd: day, store_id: current_store)
      end
      category_ids.each do |id|
        new_income =
          Income.new(
            ymd: day,
            income_category_id: id,
            achievement_id: new_achievement.id,
            price: 0,
          )
        unless new_income.save
          new_income =
            Income.where(
              ymd: day,
              income_category_id: id,
              achievement_id: new_achievement.id,
            )[
              0
            ]
        end
        day_incomes.push(new_income)
      end
      achievements.push(new_achievement)
      incomes.push(day_incomes)
    end
    getter.push(achievements)
    incomes.each { |day_incomes| getter.push(day_incomes) }
    return getter
  end
end
