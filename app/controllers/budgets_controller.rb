class BudgetsController < ApplicationController
  before_action :check
  before_action :first_getter

  def edit
    search_check
  end
  def update
    @budget = Budget.find(params[:id])
    unless @budget.update_attributes(budget_params)
      search_check
      render :edit
    else
      redirect_to edit_budgets_path(
                    year: @budget[:ymd].year,
                    month: @budget[:ymd].month,
                    target_num: params[:target_num],
                  )
    end
  end

  private

  def budget_params
    params
      .require(:budget)
      .permit(
        @target_columns[params[:target_num].to_i].map { |i| i[:name].to_sym },
      )
  end

  def first_getter
    @year_range = Date.today.year - 1..Date.today.year + 1
    @targets = TargetBudgets.columns
    @target_columns = [
      TargetBudgets.income,
      TargetBudgets.variable,
      TargetBudgets.fixed,
    ]
    @new_ratio =
      BudgetsDayRatio
        .where(store_id: current_store.id)
        .order(updated_at: :desc)[
        0
      ].id
  end

  def search_check
    if params[:year].present? && params[:month].present? &&
         params[:target_num].present?
      second_getter(
        params[:year].to_i,
        params[:month].to_i,
        params[:target_num].to_i,
      )
    else
      second_getter(Date.today.year, Date.today.month, 0)
    end
  end

  def second_getter(year, month, target_num)
    @ymd = Date.new(year, month)

    @budget =
      if Budget.where(ymd: @ymd, store_id: current_store.id)[0].present?
        Budget.where(ymd: @ymd, store_id: current_store.id)[0]
      elsif Budget.where(ymd: @ymd - 1.month, store_id: current_store.id)[0]
            .present?
        budget =
          Budget.where(ymd: @ymd - 1.month, store_id: current_store.id)[0].dup
        budget.ymd = @ymd
        budget
      else
        Budget.new(
          ymd: @ymd,
          store_id: current_store.id,
          budgets_day_ratio_id: @new_ratio,
        )
      end
    @budget.budgets_day_ratio_id = @new_ratio
    @budget.save
    @target_num = target_num
    @target_column = @target_columns[target_num]
    @id = @budget.id
  end

  def check
    redirect_to root_path unless store_signed_in?
  end
end
