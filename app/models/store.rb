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

  validates :name, presence: true
  validates :name, uniqueness: true

end
