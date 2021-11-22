class IncomeCategory < ActiveHash::Base
  self.data = [{ id: 1, name: '雑収入' }, { id: 2, name: '受取利息' }]

  include ActiveHash::Associations
  has_many :incomes
end
