class SettlementFeeSubject < ApplicationRecord
  has_many :day_settlement_fee
  has_many :month_settlement_fee
  belongs_to :store
end
