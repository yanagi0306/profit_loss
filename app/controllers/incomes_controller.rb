class IncomesController < ApplicationController
  before_action :check
  before_action :today_date_getter

  def index
    selected_instance_getter(@this_year, @this_month, current_store.id)

  end

  def search
    selected_instance_getter(params[:year], params[:month], current_store.id)
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

  def selected_instance_getter(year,month,current_store)
    @achievements = Income.search_getter(year, month, current_store)[0]
    @selected_dates = @achievements.map{|i| i[:ymd]}
    @selected_year = @selected_dates[0].year
    @selected_month = @selected_dates[0].month
    @incomes = Income.search_getter(year, month, current_store)
    @incomes.delete_at(0)
  end

  def check
    redirect_to root_path unless store_signed_in?
  end
end
