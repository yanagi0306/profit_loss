class VariableCostsController < ApplicationController
  before_action :check
  before_action :today_date_getter

  def edit
    initial_edit
  end
  def update
    params_date
    @error_messages = VariableCost.update_variable_costs(variable_cost_params)
    unless @error_messages.empty?
      initial_edit
      render :edit
    else
      redirect_to edit_variable_costs_path(
                    year: @params_ymd.year,
                    month: @params_ymd.month,
                    selected_targets_num: @selected_targets_num,
                  )
    end
  end

  private

  def initial_edit
    if params[:year].present? && params[:month].present? &&
         params[:selected_targets_num]
      selected_instance_getter(
        params[:year],
        params[:month],
        params[:selected_targets_num],
        current_store.id,
      )
    else
      selected_instance_getter(@this_year, @this_month, 0, current_store.id)
    end
  end

  def variable_cost_params
    params
      .require(:variable_cost)
      .permit(
        variable_costs: %i[
          food_cost
          material_cost
          pert_cost
          miscellaneous_cost
          delivery_commission
          electric
          water
          gas
          power
          communications_variable
          publicity_variable
          garbage_variable
          car_variable
          credit_variable
          clean_variable
          overtime_employee_cost
          social_insurance_part
          meeting
          traveling
          selling_administration_cost
          interest_payment
        ],
      )[
      :variable_costs
    ]
  end

  def params_date
    @params_ymd =
      VariableCost.find(params[:variable_cost][:variable_costs].keys[0])[:ymd]
  end

  def today_date_getter
    @now = Date.today
    @wday = %w[日 月 火 水 木 金 土]
    @this_year = @now.year
    @this_month = @now.month
    @year_range = current_store.opening_year..@this_year
    @input_days = {
      '毎日入力' => %w[食材費 資材費 P人件費 雑費 デリバリー手数料],
    }
    @input_utilities = { '光熱費' => %w[電気代 水道代 ガス代 動力代] }
    @input_fixed_adds = {
      '固定費追加分' => %w[
        通信変動費
        広告変更費
        ゴミ処理変動費
        車両変更費
        クレジット変動
        衛生管理変動
      ],
    }
    @input_miscellaneous = {
      'その他' => %w[
        社員残業代
        P社会保険
        会議費
        旅費交通費
        販売管理費
        支払い利息
      ],
    }
    @inputs = [
      @input_days,
      @input_utilities,
      @input_fixed_adds,
      @input_miscellaneous,
    ]

  end
  def selected_instance_getter(year, month, selected_targets_num, current_store)

    getter = VariableCost.search_getter(year, month, current_store)
    @achievements = getter.delete_at(0)
    @variable_costs = getter.delete_at(0)
    @selected_dates = @achievements.map { |i| i[:ymd] }
    @selected_year = @selected_dates[0].year
    @selected_month = @selected_dates[0].month
    @last_day = @selected_dates.last.day
    @selected_column = @inputs[selected_targets_num]
    @selected_targets_num = selected_targets_num
  end
  def check
    redirect_to root_path unless store_signed_in?
  end
end
