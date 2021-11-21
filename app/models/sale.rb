class Sale < ApplicationRecord
  belongs_to :achievement

  validates :total_price_match?
  validates :ymd, uniqueness: true
  validate :price,
           :ymd,
           :lunch_sales,
           :dinner_sales,
           presence: {
             message: 'が未入力です',
           }

  private

  def total_price_match?
    return unless price == lunch_sales + dinner_sales
    errors.add(:base, '売上入力に失敗しました')
  end
end
