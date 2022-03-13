class TargetVariable
  def self.items
    [
      { id: 0, name: '毎日入力' },
      { id: 1, name: '光熱費' },
      { id: 2, name: '固定費追加分' },
      { id: 3, name: 'その他' },
    ]
  end
  def self.days
    [
      { id: 0, name: 'food_cost', ja_name: '食材費' },
      { id: 1, name: 'material_cost', ja_name: '資材費' },
      { id: 2, name: 'pert_cost', ja_name: 'P人件費' },
      { id: 3, name: 'consumption_tax', ja_name: '消費税' },
      { id: 4, name: 'miscellaneous_cost', ja_name: '雑費' },
      { id: 5, name: 'delivery_commission', ja_name: 'デリバリー手数料' },
    ]
  end

  def self.utilities
    [
      { id: 0, ja_name: '電気代', name: 'electric' },
      { id: 1, ja_name: '水道代', name: 'water' },
      { id: 2, ja_name: 'ガス代', name: 'gas' },
      { id: 3, ja_name: '動力代', name: 'power' },
    ]
  end

  def self.fixed_add
    [
      { id: 0, name: 'communications_variable', ja_name: '通信費変動' },
      { id: 1, name: 'publicity_variable', ja_name: '広告変動' },
      { id: 2, name: 'garbage_variable', ja_name: 'ゴミ処理変動' },
      { id: 3, name: 'car_variable', ja_name: '車両費変動' },
      { id: 4, name: 'credit_variable', ja_name: 'クレジット変動' },
      { id: 5, name: 'clean_variable', ja_name: '衛生管理変動' },
    ]
  end

  def self.miscellaneous
    [
      { id: 0, ja_name: '社員残業代', name: 'overtime_employee_cost' },
      { id: 1, ja_name: 'P社会保険', name: 'social_insurance_part' },
      { id: 2, ja_name: '会議費', name: 'meeting' },
      { id: 3, ja_name: '旅費交通費', name: 'traveling' },
      { id: 4, ja_name: '減価償却費', name: 'selling_administration_cost' },
      { id: 5, ja_name: '受取利息', name: 'interest_payment' },
    ]
  end
end
