class IncomeCategory < ActiveHash::Base
  self.data = [{ id: 1, name: '雑収入' ,achievement_column_name:"miscellaneous_income"}, { id: 2, name: '受取利息' ,achievement_column_name:"interest_income"}]

  include ActiveHash::Associations
  has_many :incomes
end
2545
