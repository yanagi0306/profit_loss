class SalesController < ApplicationController
  before_action :check
  before_action :today_date_getter

  def edit
    initial_edit
  end
  def update
    params_date
    @error_messages = Sale.update_sales(sale_params)
    unless @error_messages.empty?
      initial_edit
      render :edit
    else
      redirect_to edit_sales_path(
                    year: @params_ymd.year,
                    month: @params_ymd.month,
                  )
    end
  end
  private


  def initial_edit
    if params[:year].present? && params[:month].present?
      selected_instance_getter(params[:year], params[:month], current_store.id)
    else
      selected_instance_getter(@this_year, @this_month, current_store.id)
    end
  end

  def sale_params
    params
      .require(:sale)
      .permit(sales: [:sale,:lunch_sale,:dinner_sale])[
      :sales
    ]
  end

  def params_date
    @params_ymd = Sale.find(params[:sale][:sales].keys[0])[:ymd]
  end

  def today_date_getter
    @now = Date.today
    @wday = %w[日 月 火 水 木 金 土]
    @this_year = @now.year
    @this_month = @now.month
    @year_range = current_store.opening_year..@this_year
    @input_columns = ['店舗売上','ランチ売上','ディナー売上']
  end
  def selected_instance_getter(year, month, current_store)
    getter = Sale.search_getter(year, month, current_store)
    @achievements = getter.delete_at(0)
    @sales = getter.delete_at(0)
    @selected_dates = @achievements.map { |i| i[:ymd] }
    @selected_year = @selected_dates[0].year
    @selected_month = @selected_dates[0].month
    @last_day = @selected_dates.last.day


  end
  def check
    redirect_to root_path unless store_signed_in?
  end
end
