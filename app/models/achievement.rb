class Achievement < ApplicationRecord
  has_one :day_delivery_commission
  has_one :month_delivery_commission
  has_one :day_settlement_fee
  has_one :month_settlement_fee
  belongs_to :store

  validates :store_id, presence: { message: 'としてログインされていません' }
  validates :ymd, presence: true, uniqueness: { scope: :store_id }


end
