class Budget < ApplicationRecord
  belongs_to :store
  belongs_to :budgets_day_ratio

  validates :budgets_day_ratio_id, presence: true
  validates :store_id, presence: true
  validates :ymd, presence: true, uniqueness: { scope: %i[store_id] }

  def self.get_budget(ymd, ratio, current_store)
    if Budget.where(ymd: ymd, store_id: current_store)[0].present?
      Budget.where(ymd: ymd, store_id: current_store)[0]
    elsif Budget.where(ymd: ymd - 1.month, store_id: current_store)[0].present?
      budget = Budget.where(ymd: ymd - 1.month, store_id: current_store)[0].dup
      budget.ymd = ymd
      budget
    else
      Budget.new(ymd: ymd, store_id: current_store, budgets_day_ratio_id: ratio)
    end
  end

  def self.updates_fixed_achievements(params, budget, budget_params, current_store)
    if params[:target_num].to_i == 2 &&
         Achievement.where(
           store_id: current_store,
           ymd: budget[:ymd] + 1.month - 1.day,
         )[
           0
         ].present?
      Achievement.where(
        store_id: current_store,
        ymd: budget[:ymd] + 1.month - 1.day,
      )[
        0
      ].update_attributes(budget_params)
    elsif params[:target_num].to_i == 2
      achievement =
        Achievement.create(
          ymd: budget[:ymd] + 1.month - 1.day,
          store_id: current_store,
        )
      achievement.update_attributes(budget_params)
    end
  end
end
