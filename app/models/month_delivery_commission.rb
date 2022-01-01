class MonthDeliveryCommission < ApplicationRecord
  belongs_to :achievement
  belongs_to :delivery_commission_subject
end
