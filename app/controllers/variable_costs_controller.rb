class VariableCostsController < ApplicationController

    before_action :check
    before_action :today_date_getter

    def edit
      initial_edit
    end
    def update
      params_date
      @error_messages = VariableCost.update_variables(variable_params)
      unless @error_messages.empty?
        initial_edit
        render :edit
      else
        redirect_to edit_variables_path(
                      year: @params_ymd.year,
                      month: @params_ymd.month,
                      selected_target: @selected_target
                    )
      end
    end
    private


    def initial_edit
      if params[:year].present? && params[:month].present?&&params[:selected_target]
        selected_instance_getter(params[:year], params[:month],params[:selected_target],current_store.id)
      else
        selected_instance_getter(@this_year, @this_month,0, current_store.id)
      end
    end

    def variable_params
      params
        .require(:variable)
        .permit(variables: [:variable,:lunch_variable,:dinner_variable])[
        :variables
      ]
    end

    def params_date
      @params_ymd = Variable.find(params[:variable][:variables].keys[0])[:ymd]
    end

    def today_date_getter
      @now = Date.today
      @wday = %w[日 月 火 水 木 金 土]
      @this_year = @now.year
      @this_month = @now.month
      @year_range = current_store.opening_year..@this_year
      @input_days = '毎日入力'=>['食材費','資材費','P人件費','雑費','デリバリー手数料']
      @input_utilities = '光熱費'=>['電気代','水道代','ガス代','動力代']
      @input_fixed_adds = '固定費追加分'=>['通信変動費','広告変更費','ゴミ処理変動費','車両変更費','クレジット変動','衛生管理変動']
      @input_miscellaneous = 'その他'=>['社員残業代','P社会保険','会議費','旅費交通費','販売管理費','支払い利息']
      @inputs = [@input_days,@input_utilities,@input_fixed_adds,@input_miscellaneous]
    end
    def selected_instance_getter(year, month,selected_target, current_store)
      getter = Variable.search_getter(year, month, current_store)
      @achievements = getter.delete_at(0)
      @variables = getter.delete_at(0)
      @selected_dates = @achievements.map { |i| i[:ymd] }
      @selected_year = @selected_dates[0].year
      @selected_month = @selected_dates[0].month
      @last_day = @selected_dates.last.day
      @selected_column = @inputs[selected_target]
      @selected_target = selected_target


    end
    def check
      redirect_to root_path unless store_signed_in?
    end


end
