class TargetAchievements
  def self.columns
    [
      { id: 0, name: '売上' },
      { id: 1, name: '仕入,パート人件費等' },
      { id: 2, name: '決済手数料' },
      { id: 3, name: 'デリバリー手数料' },
      { id: 4, name: 'その他収入' },
      { id: 5, name: 'その他支出' },
    ]
  end

  def self.sale
    [
      { id: 0, name: 'sale', ja_name: '売上' },
      { id: 1, name: 'lunch_sale', ja_name: 'ランチ売上' },
      { id: 2, name: 'dinner_sale', ja_name: 'ディナー売上' },
      { id: 3, name: 'lunch_number', ja_name: 'ランチ客数' },
      { id: 4, name: 'dinner_number', ja_name: 'ディナー客数' },
    ]
  end

  def self.purchasing_etc
    [
      { id: 0, name: 'food_cost', ja_name: '食材費' },
      { id: 1, name: 'material_cost', ja_name: '資材費' },
      { id: 2, name: 'pert_cost', ja_name: 'パート人件費' },
      { id: 3, name: 'miscellaneous_cost', ja_name: '雑費' },
    ]
  end

  def self.other_income
    [
      { id: 0, name: 'interest_income', ja_name: '受取利息' },
      { id: 1, name: 'miscellaneous_income', ja_name: '雑収入' },
    ]
  end

  def self.other_spending
    [
      { id: 0, name: 'electric', ja_name: '電気代' },
      { id: 1, name: 'water', ja_name: '水道代' },
      { id: 2, name: 'gas', ja_name: 'ガス代' },
      { id: 3, name: 'power', ja_name: '動力代' },
      { id: 4, name: 'overtime_employee_cost', ja_name: '社員残業代' },
      { id: 5, name: 'meeting', ja_name: '会議費' },
      { id: 6, name: 'borrowing', ja_name: '銀行等借入' },
      { id: 7, name: 'interest_payment', ja_name: '支払い利息' },
      { id: 8, name: 'communications_add', ja_name: '通信費追加' },
      { id: 9, name: 'publicity_add', ja_name: '広告宣伝追加' },
      { id: 10, name: 'garbage_add', ja_name: 'ゴミ処理追加' },
      { id: 11, name: 'clean_add', ja_name: '衛生管理追加' },
      { id: 12, name: 'welfare_add', ja_name: '福利厚生追加' },
    ]
  end
end
