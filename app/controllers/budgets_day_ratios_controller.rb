class BudgetsDayRatiosController < ApplicationController
  before_action :check

  def index
    @budgets_day_ratio = BudgetsDayRatio.new
    now_ratio
  end
  def create
    @budgets_day_ratio = BudgetsDayRatio.new(ratio_params)
    if @budgets_day_ratio.save
      redirect_to budgets_day_ratios_path
    else
      now_ratio
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
  def now_ratio
    @now_store_ratio =
      BudgetsDayRatio
        .where(store_id: current_store.id)
        .order(created_at: :desc)[
        0
      ]
  end
end
