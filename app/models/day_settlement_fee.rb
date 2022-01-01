class DaySettlementFee < ApplicationRecord
  belongs_to :achievement
  belongs_to :settlement_fee_subject
end
