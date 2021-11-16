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
  has_one :sales
  validates :name, presence: true
  validates :name, uniqueness: true
end
