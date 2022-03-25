class TargetSearch
  def self.sales
    [
      { id: 0, name: 'sale', ja_name: '売上' },
      { id: 1, name: 'lunch_sale', ja_name: 'ランチ売上' },
      { id: 2, name: 'dinner_sale', ja_name: 'ディナー売上' },
      { id: 1, name: 'lunch_delivery', ja_name: 'ランチテイク売上' },
      { id: 2, name: 'dinner_delivery', ja_name: 'ディナーテイク売上' },
    ]
  end
  def self.total_number
    %w[lunch_number dinner_number]
  end
  def self.other_sales
    [
      { id: 0, name: 'lunch_number', ja_name: 'ランチ客数' },
      { id: 1, name: 'dinner_number', ja_name: 'ディナー客数' },
      { id: 2, name: 'interest_income', ja_name: '受取利息' },
      { id: 3, name: 'miscellaneous_income', ja_name: '雑収入' },
    ]
  end

  def self.total_sales
    %w[sale interest_income miscellaneous_income]
  end

  def self.costs_variable
    [
      { id: 0, name: 'food_cost', ja_name: '食材費' },
      { id: 1, name: 'material_cost', ja_name: '資材費' },
      { id: 2, name: 'pert_cost', ja_name: 'P人件費' },
      { id: 3, name: 'overtime_employee_cost', ja_name: '社員残業代' },
    ]
  end
  def self.costs_fixed
    [
      { id: 0, name: 'employee_cost', ja_name: 'R人件費' },
      { id: 1, name: 'director_cost', ja_name: '役員報酬' },
    ]
  end
  def self.labor_costs
    %w[pert_cost overtime_employee_cost employee_cost director_cost]
  end

  def self.total_costs
    TargetSearch.costs_variable.map { |i| i[:name] } +
      TargetSearch.costs_fixed.map { |i| i[:name] }
  end

  def self.other
    [
      { id: 0, name: 'electric', ja_name: '電気代' },
      { id: 1, name: 'water', ja_name: '水道代' },
      { id: 2, name: 'gas', ja_name: 'ガス代' },
      { id: 3, name: 'power', ja_name: '動力代' },
      { id: 4, name: 'social_insurance_part', ja_name: 'P社会保険' },
      { id: 5, name: 'meeting', ja_name: '会議費' },
      { id: 6, name: 'traveling', ja_name: '旅費交通費' },
      { id: 7, name: 'selling_administration_cost', ja_name: '減価償却費' },
    ]
  end
  def self.variable_items
    TargetSearch.other.map { |i| i[:name] } + ['overtime_employee_cost']
  end
  def self.day
    [
      { id: 0, name: 'consumption_tax', ja_name: '消費税' },
      { id: 1, name: 'miscellaneous_cost', ja_name: '雑費' },
      { id: 2, name: 'delivery_commission', ja_name: 'デリバリー手数料' },
    ]
  end
  def self.other_fixed
    [
      { id: 0, name: 'rent', ja_name: '家賃' },
      { id: 1, name: 'company_interest', ja_name: '火災保険等' },
      { id: 2, name: 'social_insurance_employee', ja_name: 'R社会保険' },
      { id: 3, name: 'resident_tax', ja_name: '市民税県民税' },
      { id: 4, name: 'pos_system', ja_name: 'POS管理費' },
      { id: 5, name: 'welfare_fixed', ja_name: '福利厚生費' },
      { id: 6, name: 'delivery_fixed', ja_name: 'デリバリー管理費' },
      { id: 7, name: 'interest_payment', ja_name: '支払利息' },
      { id: 8, name: 'borrowing', ja_name: '銀行等借入' },
      { id: 9, name: 'tax_counsellor', ja_name: '税理士' },
      { id: 10, name: 'labor_counsellor', ja_name: '社労士' },
    ]
  end
  def self.fixed
    [
      { id: 0, name: 'communications_fixed', ja_name: '通信費' },
      { id: 1, name: 'publicity_fixed', ja_name: '広告宣伝費' },
      { id: 2, name: 'garbage_fixed', ja_name: 'ゴミ処理費' },
      { id: 3, name: 'car_fixed', ja_name: '車両管理費' },
      { id: 4, name: 'credit_fixed', ja_name: 'クレジット管理費' },
      { id: 5, name: 'clean_fixed', ja_name: '衛生管理費' },
    ]
  end
  def self.add
    [
      { id: 0, name: 'communications_variable', ja_name: '通信費' },
      { id: 1, name: 'publicity_variable', ja_name: '広告宣伝費' },
      { id: 2, name: 'garbage_variable', ja_name: 'ゴミ処理' },
      { id: 3, name: 'car_variable', ja_name: '車両管理費' },
      { id: 4, name: 'credit_variable', ja_name: 'クレジット管理費' },
      { id: 5, name: 'clean_variable', ja_name: '衛生管理費' },
    ]
  end

  def self.all_fixed
    TargetSearch.costs_fixed.map { |i| i[:name] } +
      TargetSearch.other_fixed.map { |i| i[:name] } +
      TargetSearch.fixed.map { |i| i[:name] }
  end
  def self.total_other
    TargetSearch.add.map { |i| i[:name] } +
      TargetSearch.day.map { |i| i[:name] } +
      TargetSearch.fixed.map { |i| i[:name] } +
      TargetSearch.other_fixed.map { |i| i[:name] } +
      TargetSearch.other.map { |i| i[:name] }
  end
  def self.total_loss
    TargetSearch.total_other + TargetSearch.total_costs
  end

  def self.columns
    {
      sale: 0,
      lunch_sale: 0,
      dinner_sale: 0,
      lunch_delivery: 0,
      dinner_delivery: 0,
      lunch_number: 0,
      dinner_number: 0,
      interest_income: 0,
      miscellaneous_income: 0,
      food_cost: 0,
      material_cost: 0,
      pert_cost: 0,
      employee_cost: 0,
      director_cost: 0,
      overtime_employee_cost: 0,
      electric: 0,
      water: 0,
      gas: 0,
      power: 0,
      consumption_tax: 0,
      miscellaneous_cost: 0,
      delivery_commission: 0,
      social_insurance_part: 0,
      meeting: 0,
      traveling: 0,
      selling_administration_cost: 0,
      rent: 0,
      company_interest: 0,
      social_insurance_employee: 0,
      resident_tax: 0,
      pos_system: 0,
      welfare_fixed: 0,
      delivery_fixed: 0,
      interest_payment: 0,
      borrowing: 0,
      tax_counsellor: 0,
      labor_counsellor: 0,
      communications_fixed: 0,
      publicity_fixed: 0,
      garbage_fixed: 0,
      car_fixed: 0,
      credit_fixed: 0,
      clean_fixed: 0,
      communications_variable: 0,
      publicity_variable: 0,
      garbage_variable: 0,
      car_variable: 0,
      credit_variable: 0,
      clean_variable: 0,
    }
  end
end
