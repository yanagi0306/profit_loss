class IncomesController < ApplicationController
  before_action :check
  before_action :today_date_getter
  respond_to :html

  def edit
    initial_index



  end
  def update
    params_date
    success = true
    income_params.to_unsafe_h.each do |id, income_param|
      income = Income.find(income_param[:id].to_i)
      success = false unless income.update_attributes(income_param)
      column = income.income_category.achievement_column_name
      achievement = Achievement.find(income[:achievement_id])
      unless income[:price] == achievement[column]
        achievement[column] = income[:price]
        achievement.save
      end
    end
    if success == false
      initial_index
      render :edit

    else
      redirect_to edit_incomes_path(year: @params_ymd.year, month: @params_ymd.month)
    end
  end

  private

  def initial_index
    if params[:year].present? && params[:month].present?
      selected_instance_getter(params[:year], params[:month], current_store.id)
    else
      selected_instance_getter(@this_year, @this_month, current_store.id)
    end
  end

  def income_params
    params.permit(incomes: %i[id ymd income_category_id price])[:incomes]
  end

  def params_date
    @params_ymd = Income.find(params[:incomes].keys[0])[:ymd]
  end

  def today_date_getter
    @now = Date.today
    @wday = %w[日 月 火 水 木 金 土]
    @this_year = @now.year
    @this_month = @now.month
    @year_range = current_store.opening_year..@this_year
    @category_ids = IncomeCategory.data.map { |i| i[:id] }
    @category_length = @category_ids.length
    @category_names = IncomeCategory.data.map { |i| i[:name] }
  end

  def selected_instance_getter(year, month, current_store)
    getter = Income.search_getter(year, month, current_store)
    @achievements = getter.delete_at(0)
    @incomes = getter.delete_at(0)
    @selected_dates = @achievements.map { |i| i[:ymd] }
    @selected_year = @selected_dates[0].year
    @selected_month = @selected_dates[0].month
  end

  def check
    redirect_to root_path unless store_signed_in?
  end
end
