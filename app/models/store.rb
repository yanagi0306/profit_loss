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
  validates :name, presence: true
  validates :name, uniqueness: true
end
