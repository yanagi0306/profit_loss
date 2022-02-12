class Sale < ApplicationRecord
  belongs_to :achievement
  belongs_to :store

  validate :sale_check
  validates :ymd, uniqueness: { scope: %i[store_id] }
  validates :ymd, presence: { message: 'が未入力です' }
  validates :achievement_id, presence: { message: 'と紐付いていません' }
  validates :sale,
            :lunch_sale,
            :dinner_sale,
            :lunch_delivery,
            :dinner_delivery,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 3000000,
            },
            allow_blank: true
  validates :lunch_number,
            :dinner_number,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 1000,
            },
            allow_blank: true

  def sale_check
    unless sale == lunch_sale + dinner_sale + lunch_delivery + dinner_delivery
      errors.add(:base, '入力された数値が不正です')
    end
  end
  def self.search_getter(year, month, current_store)
    select_month = Date.new(year.to_i, month.to_i)
    first_day = select_month.beginning_of_month
    last_day = first_day + 1.month - 1.day
    month_range = first_day..last_day

    getter = []
    sales = []
    achievements = []
    month_range.each do |day|
      if Achievement.exists?(ymd: day, store_id: current_store)
        new_achievement =
          Achievement.where(ymd: day, store_id: current_store)[0]
      else
        new_achievement = Achievement.create(ymd: day, store_id: current_store)
      end
      achievements.push(new_achievement)

      new_sale =
        Sale.new(
          ymd: day,
          achievement_id: new_achievement.id,
          store_id: current_store,
        )
      unless new_sale.save
        new_sale = Sale.where(ymd: day, achievement_id: new_achievement.id)[0]
      end
      sales.push(new_sale)
    end
    getter.push(achievements)
    getter.push(sales)
    return getter
  end

  def self.update_sales(sale_params)
    error_messages = []
    sale_params.to_unsafe_h.each do |id, sale_param|
      sale = Sale.find(id)

      unless sale.update_attributes(sale_param)
        error_message =
          "エラー！ #{sale[:ymd].month} / #{sale[:ymd].day}の入力に誤りがあり更新できませんでした！"
        error_messages.push(error_message)
        next
      end
      achievement = Achievement.find(sale[:achievement_id])
      achievement.update_attributes(sale_param)
    end
    return error_messages
  end



end
