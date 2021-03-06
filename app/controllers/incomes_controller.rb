class IncomesController < ApplicationController
  before_action :check
  before_action :today_date_getter

  def edit
    initial_edit
  end
  def update
    params_date
    @error_messages = Income.update_incomes(income_params)
    unless @error_messages.empty?
      initial_edit
      render :edit
    else
      redirect_to edit_incomes_path(
                    year: @params_ymd.year,
                    month: @params_ymd.month,
                  )
    end
  end

  private

  def initial_edit
    if params[:year].present? && params[:month].present?
      selected_instance_getter(params[:year], params[:month], current_store.id)
    else
      selected_instance_getter(Date.today.year, Date.today.month, current_store.id)
    end
  end

  def income_params
    params.require(:income).permit(incomes: [:price])[:incomes]
  end

  def params_date
    @params_ymd = Income.find(params[:income][:incomes].keys[0])[:ymd]
  end

  def today_date_getter
    @wday = %w[日 月 火 水 木 金 土]
    @year_range = current_store.opening_year..Date.today.year
    @category_ids = IncomeCategory.data.map { |i| i[:id] }
    @category_length = @category_ids.length
    @category_names = IncomeCategory.data.map { |i| i[:name] }
  end

  def selected_instance_getter(year, month, current_store)
    getter = Income.search_getter(year, month, current_store)
    @achievements = getter.delete_at(0)
    @incomes = getter.delete_at(0)
    selected_dates = @achievements.map { |i| i[:ymd] }
    @selected_year = selected_dates[0].year
    @selected_month = selected_dates[0].month
  end

  def check
    redirect_to root_path unless store_signed_in?
  end
end
