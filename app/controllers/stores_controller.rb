class StoresController < ApplicationController
  before_action :check
  before_action :first_getter

  def index
    gon.month1_budget = Store.get_budget(@ymd - 1.month, current_store.id)
    gon.month2_budget = Store.get_budget(@ymd - 2.month, current_store.id)
    gon.month1_achievement =
      Store.get_achievement(
        @ymd - 1.month..@ymd - 1.day,
        @total_budget,
        current_store.id,
      )

    gon.month2_achievement =
      Store.get_achievement(
        @ymd - 2.month..@ymd - 1.month - 1.day,
        @total_budget,
        current_store.id,
      )

    gon.budget = @total_budget
    gon.achievement = @total_achievement
  end

  def search; end

  def day_search
    @achievements =
      Store.get_achievements(
        @target_ranges,
        @total_achievement,
        @budget,
        current_store.id,
      )
  end

  private

  def first_getter
    @wday = %w[日 月 火 水 木 金 土]
    @year_range = current_store.opening_year..Date.current.year
    @ymd =
      if params[:year].present? && params[:month].present?
        Date.new(params[:year].to_i, params[:month].to_i)
      else
        Date.new(Date.current.year, Date.current.month)
      end
    month_ranges = @ymd..@ymd + 1.month - 1.day

    @month_check = month_ranges.cover?(Date.current)
    @target_ranges =
      @month_check ? Date.current.beginning_of_month..Date.current : month_ranges

    @budget = Store.get_budget(@ymd, current_store.id)

    @ratio = BudgetsDayRatio.find(@budget.budgets_day_ratio_id)
    @total_budget = TargetSearch.columns
    if @month_check
      @target_ranges.each do |day|
        @total_budget.keys.each do |column|
          @total_budget[column.to_sym] +=
            (@budget[column.to_sym] * Store.day_ratio(day, @ratio)).floor
        end
      end
    else
      @total_budget = @budget
    end
    @total_achievement =
      Store.get_achievement(@target_ranges, @total_budget, current_store.id)
  end

  def check
    redirect_to new_store_session_path unless store_signed_in?
  end

  def budget_columns(columns, budget)
    value = 0
    columns.each { |column| value += budget[column.to_sym] }
    return value.floor
  end

  def achievement_columns(columns, achievement)
    value = 0
    columns.each { |column| value += achievement[column.to_sym] }
    return value
  end

  def comparison(item1, item2)
    if item2 != 0 && item1 != 0
      return item1.to_i.fdiv(item2.to_i)
    else
      return 0
    end
  end

  def percentage(item1, item2)
    if item2 != 0 && item1 != 0
      "#{(comparison(item1, item2) * 100).floor(2)}%"
    else
      return '0.00%'
    end
  end

  def get_achievement(achievements, ymd)
    if achievements.where(ymd: ymd)[0].present?
      return achievements.where(ymd: ymd)[0]
    else
      return 0
    end
  end

  helper_method :budget_columns
  helper_method :achievement_columns
  helper_method :comparison
  helper_method :percentage
  helper_method :get_achievement
end
