class Income < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :achievement
  belongs_to :income_category

  validates :ymd, presence: true, uniqueness: { scope: [:income_category_id, :achievement_id]}
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
      achievements.push(new_achievement)
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
        incomes.push(new_income)
      end
    end
    getter.push(achievements)
    getter.push(incomes)
    return getter
  end

  def self.update_incomes(income_params)
    error_messages = []
    income_params.to_unsafe_h.each do |id, income_param|
      income = Income.find(income_param[:id].to_i)

      unless income.update_attributes(income_param)
        error_message =
          "エラー！ #{income[:ymd].month} / #{income[:ymd].day} #{income.income_category.name}の入力に誤りがあり更新できませんでした！"
        error_messages.push(error_message)
        next
      end

      column = income.income_category.achievement_column_name
      achievement = Achievement.find(income[:achievement_id])
      unless income[:price] == achievement[column]
        achievement[column] = income[:price]
        achievement.save
      end
    end
    return error_messages
  end
end
