class StoresController < ApplicationController
  before_action :check

  def index; end

  def search
    first_getter

    @achievements = Achievement.where(ymd: [@ymd_ranges], store_id: params[:id])
  end

  private

  def first_getter
    @wday = %w[日 月 火 水 木 金 土]
    @year_range = current_store.opening_year..Date.today.year
    @ymd = Date.new(params[:year].to_i, params[:month].to_i)
    @month_ranges = @ymd..@ymd + 1.month - 1.day
    @month_check = @month_ranges.cover?(Date.today)
    @target_ranges =
      @month_check ? Date.today.beginning_of_month..Date.today : @month_ranges

    budget =
      if Budget.where(ymd: @ymd, store_id: current_store.id)[0].present?
        Budget.where(ymd: @ymd, store_id: current_store.id)[0]
      elsif Budget.where(ymd: @ymd - 1.month, store_id: current_store.id)[0]
            .present?
        budget =
          Budget.where(ymd: @ymd - 1.month, store_id: current_store.id)[0].dup
        budget.ymd = @ymd
        budget.create
      else
        Budget.create(
          ymd: @ymd,
          store_id: current_store.id,
          budgets_day_ratio_id:
            BudgetsDayRatio
              .where(store_id: current_store.id)
              .order(updated_at: :desc)[
              0
            ].id,
        )
      end

    @ratio = BudgetsDayRatio.find(budget.budgets_day_ratio_id)
    @total_budget = TargetSearch.columns
    if @month_check
      @target_ranges.each do |day|
        @total_budget.keys.each do |column|
          @total_budget[column.to_sym] += budget[column.to_sym] * day_ratio(day)
        end
      end
    else
      @total_budget = budget
    end

    @achievements =
      Achievement.where(ymd: [@target_ranges], store_id: params[:id])
    @total_achievement = TargetSearch.columns
    @achievements.each do |achievement|
      @total_achievement.keys.each do |column|
        @total_achievement[column.to_sym] += achievement[column.to_sym]
      end
    end
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

    @month_ranges.each do |day|
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

  def budget_columns(columns)
    value = 0
    columns.each do |column|
      value += @total_budget[column.to_sym]
    end
    return value.floor
  end

  def achievement_columns(columns)
    value = 0
    columns.each do |column|
      value += @total_achievement[column.to_sym]
    end
    return value
  end
  # def patch_budget(column)
  #   day_range = ''
  #   if @month_check
  #     day_range = Date.today.beginning_of_month..Date.today
  #   else
  #     day_range = @ymd_ranges
  #   end
  #   value = 0
  #   day_range.each { |day| value += @budget[column.to_sym] * day_ratio(day) }
  #   value.floor
  # end

  # def patch_budgets(columns)
  #   day_range = ''
  #   value = 0
  #   if @month_check
  #     day_range = Date.today.beginning_of_month..Date.today
  #   else
  #     day_range = @ymd_ranges
  #   end
  #   columns.each do |column|
  #     day_range.each { |day| value += @budget[column.to_sym] * day_ratio(day) }

  #   end
  #   return value.floor(0)
  # end

  # def profit_budgets(profit_columns, loss_columns)
  #   return patch_budgets(profit_columns) - patch_budgets(loss_columns)
  # end

  # def sum_achievement(column)
  #   value = 0
  #   @achievements.each do |achievement|
  #     value += achievement[column.to_sym].to_i
  #   end
  #   return value
  # end

  # def sum_achievements(columns)
  #   value = 0
  #   columns.each do |column|
  #     @achievements.each do |achievement|
  #       value += achievement[column.to_sym].to_i
  #     end
  #   end
  #   return value
  # end

  # def profit_achievements(profit_columns, loss_columns)
  #   return sum_achievements(profit_columns) - sum_achievements(loss_columns)
  # end

  # def get_percentage(column)
  #   if sum_achievement(column) != 0 && patch_budget(column) != 0
  #     "#{(sum_achievement(column).fdiv(patch_budget(column)) * 100).floor(2)}%"
  #   else
  #     return '0.00%'
  #   end
  # end

  # def get_percentages(columns)
  #   achievements = sum_achievements(columns)
  #   budgets = patch_budgets(columns)
  #   if achievements != 0 && budgets != 0
  #     "#{(achievements.to_i.fdiv(budgets.to_i)* 100).floor(2) }%"
  #   else
  #     return '0.00%'
  #   end
  # end

  # def profit_percentages(profit_columns, loss_columns)
  #   achievements = profit_achievements(profit_columns, loss_columns)
  #   budgets = profit_budgets(profit_columns, loss_columns)
  #   if achievements != 0 && budgets != 0
  #     "#{(achievements.to_i.fdiv(budgets.to_i)).floor(4) * 100}%"
  #   else
  #     return '0.00%'
  #   end
  # end

  def comparison(item1, item2)
    if item2 != 0 && item1 != 0
      return item1.to_i.fdiv(item2.to_i)
    else
      return 0
    end
  end

  def percentage(item1, item2)
    if item2 != 0 && item1 != 0
      "#{(comparison(item1, item2)* 100).floor(2) }%"
    else
      return '0.00%'
    end
  end

  # helper_method :patch_budget
  # helper_method :sum_achievement
  # helper_method :get_percentage
  # helper_method :patch_budgets
  # helper_method :sum_achievements
  # helper_method :get_percentages
  # helper_method :profit_budgets
  helper_method :budget_columns
  helper_method :achievement_columns
  helper_method :comparison
  helper_method :percentage
end
