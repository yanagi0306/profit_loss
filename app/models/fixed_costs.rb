class Fixed_costs < ActiveHash::Base
  self.data = [

    { id: 0, name: 'communications_fixed', ja_name: '通信費' },
    { id: 1, name: 'publicity_fixed', ja_name: '広告宣伝費' },
    { id: 2, name: 'garbage_fixed', ja_name: 'ゴミ処理' },
    { id: 3, name: 'car_fixed', ja_name: '車両管理費' },
    { id: 4, name: 'credit_fixed', ja_name: 'クレジット管理費' },
    { id: 5, name: 'clean_fixed', ja_name: '衛生管理費' },
    { id: 6, name: 'rent', ja_name: '家賃' },
    { id: 7, name: 'employee_cost', ja_name: '社員人件費' },
    { id: 8, name: 'director_cost', ja_name: '役員報酬' },
    { id: 9, name: 'company_interest', ja_name: '火災保険等' },
    { id: 10, name: 'social_insurance_employee', ja_name: '社会保険' },
    { id: 11, name: 'resident_tax', ja_name: '市民税県民税' },
    { id: 12, name: 'pos_system', ja_name: 'POS管理費' },
    { id: 13, name: 'welfare_fixed', ja_name: '福利厚生費' },
    { id: 14, name: 'delivery_fixed', ja_name: 'デリバリー管理費' },
    { id: 15, name: 'borrowing', ja_name: '銀行等借入' },
    { id: 16, name: 'tax_counsellor', ja_name: '税理士' },
    { id: 17, name: 'labor_counsellor', ja_name: '社労士' },
  ]
end
