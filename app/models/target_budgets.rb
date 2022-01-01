class TargetBudgets
  def self.columns
    [
      { id: 0, name: '収入客数' },
      { id: 1, name: '変動予算' },
      { id: 2, name: '固定費予算' },
    ]
  end
  def self.income
    [
      { id: 0, name: 'sale', ja_name: '月間売上' },
      { id: 1, name: 'lunch_sale', ja_name: 'ランチ売上' },
      { id: 2, name: 'dinner_sale', ja_name: 'ディナー売上' },
      { id: 3, name: 'lunch_number', ja_name: 'ランチ客数' },
      { id: 4, name: 'dinner_number', ja_name: 'ディナー客数' },
      { id: 5, name: 'interest_income', ja_name: '受取利息' },
      { id: 6, name: 'miscellaneous_income', ja_name: '雑収入' },
    ]
  end
  def self.variable
    [
      { id: 0, name: 'food_cost', ja_name: '食材費' },
      { id: 1, name: 'material_cost', ja_name: '資材費' },
      { id: 2, name: 'pert_cost', ja_name: 'P人件費' },
      { id: 3, name: 'miscellaneous_cost', ja_name: '雑費' },
      { id: 4, name: 'settlement_fee', ja_name: '決済手数料' },
      { id: 5, name: 'delivery_commission', ja_name: 'デリバリー手数料' },
      { id: 6, name: 'electric', ja_name: '電気代' },
      { id: 7, name: 'water', ja_name: '水道代' },
      { id: 8, name: 'gas', ja_name: 'ガス代' },
      { id: 9, name: 'power', ja_name: '動力代' },
      { id: 10, name: 'overtime_employee_cost', ja_name: '社員残業代' },
      { id: 11, name: 'meeting', ja_name: '会議費' },
      { id: 12, name: 'borrowing', ja_name: '銀行等借入' },
      { id: 13, name: 'interest_payment', ja_name: '支払い利息' },
    ]
  end
  def self.fixed
    [
      { id: 0, name: 'rent', ja_name: '家賃' },
      { id: 1, name: 'employee_cost', ja_name: '社員人件費' },
      { id: 2, name: 'director_cost', ja_name: '役員報酬' },
      { id: 3, name: 'traveling', ja_name: '旅費交通費' },
      { id: 4, name: 'communications_fixed', ja_name: '通信費' },
      { id: 5, name: 'publicity_fixed', ja_name: '広告宣伝費' },
      { id: 6, name: 'garbage_fixed', ja_name: 'ゴミ処理' },
      { id: 7, name: 'clean_fixed', ja_name: '衛生管理費' },
      { id: 8, name: 'welfare', ja_name: '福利厚生費' },
      { id: 9, name: 'system', ja_name: 'システム管理費' },
      { id: 10, name: 'company_interest', ja_name: '火災保険等' },
      { id: 11, name: 'resident_tax', ja_name: '市民税県民税' },
      { id: 12, name: 'tax_counsellor', ja_name: '税理士' },
      { id: 13, name: 'labor_counsellor', ja_name: '社労士' },
    ]
  end
end
