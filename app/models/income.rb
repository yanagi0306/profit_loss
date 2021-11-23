class Income < ApplicationRecord
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

  def self.search(year, month)
    select_month = Date.new(year: year, month: month)
    first_day = select_month.beginning_of_month
    last_day = first_day + 1.month - 1.day
    month_range = first_day..last_day
    category_ids = IncomeCategory.data.map { |i| i[:id] }
    incomes = []
    month_range.each do |day|
      unless Achievement.where(ymd: day, store_id: current_store.id).blank?
        new_achievement =
          Achievement.create(ymd: day, store_id: current_store.id)
      else
        new_achievement =
          Achievement.where(ymd: day, store_id: current_store.id)[0]
      end
      category_ids.each do |id|
        unless Income.where(
                 ymd: day,
                 income_category_id: id,
                 achievement_id: new_achievement.id,
               ).blank?
          new_income =
            Income.create(
              ymd: day,
              income_category_id: id,
              achievement_id: new_achievement.id,
              price: 0,
            )
        else
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
    @incomes = incomes
  end
end
