class DeliveryCommissionSubject < ApplicationRecord
  has_many :day_delivery_commission
  has_many :month_delivery_commission
  belongs_to :store
end
