class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  belongs_to :company
  has_many :budgets
  has_many :achievements
  has_many :budgets_day_ratios
  has_many :incomes
  has_many :sales
  has_many :variables

  validates :name, :opening_year, presence: true
  validates :name, uniqueness: { case_sensitive: true }
  validates :opening_year,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 2000,
              less_than_or_equal_to: Date.today.year.to_i,
              # message: 'の入力された数値が不正です'
            },
            allow_blank: true

  def self.get_achievement(target_ranges, total_budget, current_store)
    achievements =
      Achievement.where(ymd: [target_ranges], store_id: current_store)
    total_achievement = TargetSearch.columns
    achievements.each do |achievement|
      total_achievement.keys.each do |column|
        total_achievement[column.to_sym] += achievement[column.to_sym]
      end
    end
    TargetSearch.variable_items.each do |column|
      if total_achievement[column.to_sym] == 0
        total_achievement[column.to_sym] = total_budget[column.to_sym].floor
      end
    end

    TargetSearch.all_fixed.each do |column|
      total_achievement[column.to_sym] = total_budget[column.to_sym].floor
    end
    return total_achievement
  end

  def self.get_budget(ymd, current_store)
    if Budget.where(ymd: ymd, store_id: current_store)[0].present?
      Budget.where(ymd: ymd, store_id: current_store)[0]
    elsif Budget.where(ymd: ymd - 1.month, store_id: current_store)[0].present?
      budget = Budget.where(ymd: ymd - 1.month, store_id: current_store)[0].dup
      budget.ymd = ymd
      budget.create
    else
      Budget.create(
        ymd: ymd,
        store_id: current_store,
        budgets_day_ratio_id:
          BudgetsDayRatio
            .where(store_id: current_store)
            .order(updated_at: :desc)[
            0
          ].id,
      )
    end
  end

  def self.day_ratio(ymd, ratio)
    month_ranges = ymd..ymd + 1.month - 1.day
    days = [0, 0, 0, 0, 0, 0, 0, 0]
    ratios = [
      100,
      ratio.monday,
      ratio.tuesday,
      ratio.wednesday,
      ratio.thursday,
      ratio.friday,
      ratio.saturday,
      ratio.holiday,
    ]

    month_ranges.each do |day|
      if HolidayJapan.check(day)
        days[7] += 1
      else
        week = day.wday
        days[week] += 1
      end
    end

    ymd_week = HolidayJapan.check(ymd) ? 7 : ymd.wday

    denominator = 0
    ratios.each_with_index { |ratio, index| denominator += ratio * days[index] }

    return ratios[ymd_week] / denominator.to_f
  end
end
