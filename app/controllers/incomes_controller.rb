class IncomesController < ApplicationController
  before_action :check
  before_action :today_date_getter

  def index
    @incomes = Income.search(@this_year, @this_month, current_store)
    selected_date_getter
  end

  def search
    @incomes = Income.search(params[:year], params[:month], current_store)
    @incomes_by_day =
    selected_date_getter
  end
  # def updates
  #   @incomes = Income.search(params[:year], params[:month], current_store)
  #   selected_date_getter

  # end

  private




  def today_date_getter
    @now = Date.today
    @wday = %w[日 月 火 水 木 金 土]
    @this_year = @now.year
    @this_month = @now.month
    @year_range = current_store.opening_year..@this_year
    @category_ids = IncomeCategory.data.map{|i| i[:id]}
    @category_names =IncomeCategory.data.map{|i| i[:name]}
  end

  def selected_date_getter
    @selected_dates = @incomes.map { |i| i[:ymd] }.uniq
    @selected_year = @selected_dates.map { |i| i.year }.uniq[0]
    @selected_month = @selected_dates.map { |i| i.month }.uniq[0]
  end

  def check
    redirect_to root_path unless store_signed_in?
  end
end
