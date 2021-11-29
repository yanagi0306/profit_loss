class VariableCostsController < ApplicationController
  before_action :check
  before_action :today_date_getter

  def edit
    initial_edit
  end
  def update
    @error_messages = VariableCost.update_variable_costs(params_getter(params))
    unless @error_messages.empty?
      initial_edit
      render :edit
    else
      ymd =
        VariableCost.find(params[:variable_cost][:variable_costs].keys[0])[:ymd]
      redirect_to edit_variable_costs_path(
                    year: ymd.year,
                    month: ymd.month,
                    target_num: params[:target_num],
                  )
    end
  end

  private

  def params_getter(params)
    params
      .require(:variable_cost)
      .permit(
        variable_costs:
          @target_columns[params[:target_num].to_i].map { |i| i[:name].to_sym },
      )[
      :variable_costs
    ]
  end

  def initial_edit
    if params[:year].present? && params[:month].present? &&
         params[:target_num].present?
      selected_instance_getter(
        params[:year],
        params[:month],
        params[:target_num].to_i,
        current_store.id,
      )
    else
      selected_instance_getter(
        Date.today.year,
        Date.today.month,
        0,
        current_store.id,
      )
    end
  end

  def params_date; end

  def today_date_getter
    @wday = %w[日 月 火 水 木 金 土]
    @year_range = current_store.opening_year..Date.today.year
    @targets = Targets.data
    @target_columns = [
      Days.data,
      Utilities.data,
      FixedAdds.data,
      Miscellaneous.data,
    ]
  end
  def selected_instance_getter(year, month, target_num, current_store)
    getter = VariableCost.search_getter(year, month, current_store)
    @achievements = getter.delete_at(0)
    @variable_costs = getter.delete_at(0)
    @selected_dates = @achievements.map { |i| i[:ymd] }
    @selected_year = @selected_dates[0].year
    @selected_month = @selected_dates[0].month
    @last_day = @selected_dates.last.day
    @target_num = target_num
    @target_column = @target_columns[target_num]
    @columns = @target_column.map { |i| i[:name].to_sym }
  end
  def check
    redirect_to root_path unless store_signed_in?
  end
end
