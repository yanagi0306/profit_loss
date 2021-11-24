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

  def self.search(year, month, current_store)
    select_month = Date.new(year.to_i, month.to_i)
    first_day = select_month.beginning_of_month
    last_day = first_day + 1.month - 1.day
    month_range = first_day..last_day
    category_ids = IncomeCategory.data.map { |i| i[:id] }
    incomes = []
    month_range.each do |day|
      new_achievement = Achievement.new(ymd: day, store_id: current_store.id)
      unless new_achievement.save
        new_achievement =
          Achievement.where(ymd: day, store_id: current_store.id)[0]
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
        incomes.push(new_income)
      end
    end
    return incomes
  end
  # def incomes_by_day(incomes)
  #   incomes_by_day = []
  #   category_ids = IncomeCategory.data.map { |i| i[:id] }
  #   selected_dates = incomes.map { |i| i[:ymd] }.uniq
  #   selected_dates.each do |date|
  #     incomes_by_day.push(incomes.where(ymd: date))
  #   end
  # end

  private
end
