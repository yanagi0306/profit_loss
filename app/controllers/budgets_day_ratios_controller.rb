class BudgetsDayRatiosController < ApplicationController
  before_action :check

  def index
    @budgets_day_ratio = BudgetsDayRatio.new
    @now_store_ratio =
      BudgetsDayRatio
        .where(store_id: current_store.id)
        .order(created_at: :desc)
        .limit(1)
        .first_or_initialize
  end
  def create
    @budgets_day_ratio = BudgetsDayRatio.new(ratio_params)
    if @budgets_day_ratio.save
      redirect_to budgets_day_ratios_path
    else
      @now_store_ratio =
        BudgetsDayRatio
          .where(store_id: current_store.id)
          .order(created_at: :desc)
          .limit(1)
          .first_or_initialize
      render :index
    end
  end

  private

  def check
    redirect_to root_path unless store_signed_in?
  end
  def ratio_params
    params
      .require(:budgets_day_ratio)
      .permit(
        :monday,
        :tuesday,
        :wednesday,
        :thursday,
        :friday,
        :saturday,
        :holiday,
      )
      .merge(store_id: current_store.id)
  end
end
