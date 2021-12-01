class StoresController < ApplicationController
  before_action :check
  before_action :first_getter

  def index; end

  def search
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
  end

  def check
    unless store_signed_in? || company_signed_in?
      redirect_to new_store_session_path
    end
  end

  def day_patch_ratio(budgets_day_ratio, ymd)
    days = [0, 0, 0, 0, 0, 0, 0, 0]
    ratios = [
      100,
      budgets_day_ratio.monday,
      budgets_day_ratio.tuesday,
      budgets_day_ratio.wednesday,
      budgets_day_ratio.thursday,
      budgets_day_ratio.friday,
      budgets_day_ratio.saturday,
      budgets_day_ratio.holiday,
    ]
    day = @ymd_ranges.length
    @ymd_ranges.each do |day|
      if HolidayJapan.check(day)
        days[7] += 1
      else
        week = day.wday
        days[week] += 1
      end
    end
    ymd_week =
      if Holiday.check(ymd)
        7
      else
        ymd.wday
      end
      denominator = 0
      ratios.each_with_index do |ratio,index|
        denominator += ratio*days[index]
      end
      return ymd_week/denominator
  end
def period_patch_ratio(budgets_day_ratio,ymd,budget,columns)

end

   helper_method :patch_ratio


end
