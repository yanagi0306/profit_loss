class BudgetsDayRatiosController < ApplicationController
  before_action :check

  def new
    @new_ratio = BudgetsDayRatio
    .where(store_id: current_store.id)
    .order(created_at: :desc)[
    0
  ]
    @budgets_day_ratio = BudgetsDayRatio.new()

  end
  def create

    @budgets_day_ratio = BudgetsDayRatio.new(ratio_params)

    BudgetsDayRatio.check_params(params,current_store.id)

    binding.pry

    if @budgets_day_ratio.save
      redirect_to new_budgets_day_ratio_path
    else
      @error_messages =['入力に誤りがあり更新できませんでした！']
      @new_ratio= BudgetsDayRatio
      .where(store_id: current_store.id)
      .order(created_at: :desc)[
      0
    ]
      render :new
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
