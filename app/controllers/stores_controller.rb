class StoresController < ApplicationController
  before_action :check

  def index; end

  def search
    first_getter
    @budget = Budget.where(ymd: @ymd, store_id: params[:id])[0]
    @achievements = Achievement.where(ymd: [@ymd_ranges], store_id: params[:id])
    @ratio = BudgetsDayRatio.find(@budget.budgets_day_ratio_id)
  end

  private

  def first_getter
    @wday = %w[日 月 火 水 木 金 土]
    @year_range = current_store.opening_year..Date.today.year
    @ymd = Date.new(params[:year].to_i, params[:month].to_i)
    @ymd_ranges = @ymd..@ymd + 1.month - 1.day
    @month_check = @ymd_ranges.cover?(Date.today)
  end

  def check
    unless store_signed_in? || company_signed_in?
      redirect_to new_store_session_path
    end
  end

  def day_ratio(ymd)
    days = [0, 0, 0, 0, 0, 0, 0, 0]
    ratios = [
      100,
      @ratio.monday,
      @ratio.tuesday,
      @ratio.wednesday,
      @ratio.thursday,
      @ratio.friday,
      @ratio.saturday,
      @ratio.holiday,
    ]

    @ymd_ranges.each do |day|
      if HolidayJapan.check(day)
        days[7] += 1
      else
        week = day.wday
        days[week] += 1
      end
    end

    ymd_week = HolidayJapan.check(ymd) ? 7 : ymd.wday

    denominator = 0
    ratios.each_with_index { |ratio, index| denominator += ratio * days[index] }


    return ratios[ymd_week] / denominator.to_f
  end

  def patch_budget(column)
    day_range = ''
    if @month_check
      day_range = Date.today.beginning_of_month..Date.today
    else
      day_range = @ymd_ranges
    end
    value = 0
    day_range.each { |day| value += @budget[column.to_sym] * day_ratio(day) }
    value.floor
  end

  def sum_achievement(column)
    value = 0
    @achievements.each do |achievement|
      value += achievement[column.to_sym]
    end
    return value
  end
  helper_method :patch_budget
  helper_method :sum_achievement
end
