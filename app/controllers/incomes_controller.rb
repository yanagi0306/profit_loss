class IncomesController < ApplicationController
  before_action :date_getter
  def index
    @incomes = Income.search(@this_year,@this_month)
  end
  def search
    @incomes = Income.search(params[:year],params[:month])
  end
  private

  def date_getter
    @now = Date.today
    @wday = %w[日 月 火 水 木 金 土]
    @this_year = @now.year
    @this_month = @now.month
    @year_range = current_store.opening_year..@this_year
    @first_day = @now.beginning_of_month
    @last_day = @first_day + 1.month - 1.day
    @month_period = (@first_day..@last_day)
  end

  def set_incomes; end
end
