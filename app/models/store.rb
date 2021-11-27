class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  belongs_to :company
  has_many :budgets
  has_many :achievements
  has_many :budgets_day_ratios
  has_many :incomes
  has_many :sales
  has_many :variables

  validates :name,:opening_year ,presence: true
  validates :name, uniqueness: { case_sensitive: true }
  validates :opening_year,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1500,
              less_than_or_equal_to: 2021
              # message: 'の入力された数値が不正です'
            },
            allow_blank: true
end
