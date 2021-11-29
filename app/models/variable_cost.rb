class VariableCost < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :achievement
  belongs_to :store

  validates :ymd,
  presence: true,
  uniqueness: {
    scope: %i[store_id]}
  validates :achievement_id, presence: { message: 'と紐付いていません' }
  validates :food_cost,
            :material_cost,
            :pert_cost,
            :miscellaneous_cost,
            :delivery_commission,
            :electric,
            :water,
            :gas,
            :power,
            :communications_variable,
            :publicity_variable,
            :garbage_variable,
            :car_variable,
            :credit_variable,
            :clean_variable,
            :overtime_employee_cost,
            :social_insurance_part,
            :meeting,
            :traveling,
            :selling_administration_cost,
            :interest_payment,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 5_000_000,
              message: 'を選択してください',
            },
            allow_blank: true

  def self.search_getter(year, month, current_store)



    select_month = Date.new(year.to_i, month.to_i)
    first_day = select_month.beginning_of_month
    last_day = first_day + 1.month - 1.day
    month_range = first_day..last_day

    getter = []
    variable_costs = []
    achievements = []
    month_range.each do |day|
      if Achievement.exists?(ymd: day)
        new_achievement =
          Achievement.where(ymd: day, store_id: current_store)[0]
      else
        new_achievement = Achievement.create(ymd: day, store_id: current_store)
      end
      achievements.push(new_achievement)

      new_variable_cost =
        VariableCost.new(
          ymd: day,
          achievement_id: new_achievement.id,
          store_id: current_store,
        )
      unless new_variable_cost.save
        new_variable_cost =
          VariableCost.where(ymd: day, achievement_id: new_achievement.id)[0]
      end
      variable_costs.push(new_variable_cost)
    end
    getter.push(achievements)
    getter.push(variable_costs)
    return getter
  end

  def self.update_variable_costs(params)
    error_messages = []
    params.to_unsafe_h.each do |id, variable_cost_param|

      variable_cost = VariableCost.find(id)

      unless variable_cost.update_attributes(variable_cost_param)
        error_message =
          "エラー！ #{variable_cost[:ymd].month} / #{variable_cost[:ymd].day}の入力に誤りがあり更新できませんでした！"
        error_messages.push(error_message)
        next
      end
      achievement = Achievement.find(variable_cost[:achievement_id])
      achievement.update_attributes(variable_cost_param)
    end
    return error_messages
  end


end
