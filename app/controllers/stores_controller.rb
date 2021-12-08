class StoresController < ApplicationController
  before_action :check
  before_action :first_getter
  def index
    gon.month1_budget =
      Store.get_budget(@ymd - 1.month, current_store.id)
    gon.month2_budget =
      Store.get_budget(@ymd - 2.month, current_store.id)
    gon.month1_achievement =
      Store.get_achievement(@ymd - 1.month..@ymd -1.day, @total_budget, current_store.id)

    gon.month2_achievement =
      Store.get_achievement(@ymd - 2.month..@ymd - 1.month - 1.day, @total_budget, current_store.id)

    gon.budget = @total_budget
    gon.achievement = @total_achievement



    # gon.budgets = [
    #   '',
    #   '',
    #   month2_ago_budget[:sale],
    #   '',
    #   '',
    #   '',
    #   month1_ago_budget[:sale],
    #   '',
    #   '',
    #   '',
    #   @total_budget,
    #   '',
    #   '',
    # ]
    # gon.achievements = [
    #   '',
    #   month2_ago_achievement[:lunch_sale],
    #   month2_ago_achievement[:sale],
    #   month2_ago_achievement[:dinner_sale],
    #   '',
    #   month1_ago_achievement[:lunch_sale],
    #   month1_ago_achievement[:sale],
    #   month1_ago_achievement[:dinner_sale],
    #   '',
    #   @total_achievement[:lunch_sale],
    #   @total_achievement[:sale],
    #   @total_achievement[:dinner_sale],
    #   '',
    # ]
    # gon.ymd = [
    #   '',
    #   '',
    #   Sale.get_month(@ymd - 2.month),
    #   '',
    #   '',
    #   '',
    #   Sale.get_month(@ymd - 1.month),
    #   '',
    #   '',
    #   '',
    #   Sale.get_month(@ymd),
    #   '',
    #   '',
    # ]


  end
  def search; end

  private

  def first_getter
    @wday = %w[日 月 火 水 木 金 土]
    @year_range = current_store.opening_year..Date.today.year
    @ymd =
      if params[:year].present? && params[:month].present?
        Date.new(params[:year].to_i, params[:month].to_i)
      else
        Date.new(Date.today.year, Date.today.month)
      end
    month_ranges = @ymd..@ymd + 1.month - 1.day

    @month_check = month_ranges.cover?(Date.today)
    target_ranges =
      @month_check ? Date.today.beginning_of_month..Date.today : month_ranges

    budget = Store.get_budget(@ymd, current_store.id)

    @ratio = BudgetsDayRatio.find(budget.budgets_day_ratio_id)
    @total_budget = TargetSearch.columns
    if @month_check
      target_ranges.each do |day|
        @total_budget.keys.each do |column|
          @total_budget[column.to_sym] +=
            (budget[column.to_sym] * Store.day_ratio(day, @ratio)).floor
        end
      end
    else
      @total_budget = budget
    end
    @total_achievement =
      Store.get_achievement(target_ranges, @total_budget, current_store.id)
  end

  def check
    redirect_to new_store_session_path unless store_signed_in?
  end

  def budget_columns(columns)
    value = 0
    columns.each { |column| value += @total_budget[column.to_sym] }
    return value.floor
  end

  def achievement_columns(columns)
    value = 0
    columns.each { |column| value += @total_achievement[column.to_sym] }
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

  helper_method :budget_columns
  helper_method :achievement_columns
  helper_method :comparison
  helper_method :percentage
end
