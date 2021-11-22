class IncomesController < ApplicationController
  before_action :date_today
  def index; end

  private

  def date_today
    @now = Date.today
    @wday = %w[月 火 水 木 金 土 日]
    @this_year = @now.year
    @this_month = @now.month
    @year_range = current_store.opening_year..@this_year
    @first_day = @now.beginning_of_month
    @last_day = (@first_day + (7 - @first_day.wday))
    @week_period = (@first_day..@last_day)
  end
end
