class IncomesController < ApplicationController
  before_action :check
  before_action :today_date_getter
  respond_to :html

  def index
    selected_instance_getter(@this_year, @this_month, current_store.id)
  end

  def search
    selected_instance_getter(params[:year], params[:month], current_store.id)
  end
  def updates
    params_date
    selected_instance_getter(
      @params_ymd.year,
      @params_ymd.month,
      current_store.id,
    )
    @incomes =
      income_params.to_unsafe_h.map do |id, income_params|
        income = Income.find(id)
        income.update_attributes(income_params)
        income
      end
      redirect_to incomes_path
    # respond_with(@incomes, location: search_incomes_path)
  end

  private

  def income_params
    params.permit(incomes: [:id, :ymd, :income_category_id, :price])[:incomes]
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
    @category_names = IncomeCategory.data.map { |i| i[:name] }
  end

  def selected_instance_getter(year, month, current_store)
    @achievements = Income.search_getter(year, month, current_store)[0]
    @selected_dates = @achievements.map { |i| i[:ymd] }
    @selected_year = @selected_dates[0].year
    @selected_month = @selected_dates[0].month
    @incomes_by_category = Income.search_getter(year, month, current_store)
    @incomes_by_category.delete_at(0)
  end

  def check
    redirect_to root_path unless store_signed_in?
  end
end
