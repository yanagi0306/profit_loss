class VariableCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '社員残業代' },
    { id: 2, name: 'P社会保険料' },
    { id: 3, name: '通信費変動' },
    { id: 4, name: '広告宣伝費変動' },
    { id: 5, name: '交際費' },
    { id: 6, name: '会議費' },
    { id: 7, name: '旅費交通費' },
    { id: 8, name: '販売管理費' },
    { id: 9, name: 'ゴミ処理変動変動' },
    { id: 10, name: '車両費変動' },
    { id: 11, name: '衛生管理費変動' },
    { id: 12, name: 'クレジット変動' },
    { id: 13, name: 'デリバリー変動' },
    { id: 14, name: '電気代' },
    { id: 15, name: '水道代' },
    { id: 16, name: 'ガス代' },
    { id: 17, name: '動力代' },
    { id: 18, name: '支払利息' },
  ]

  include ActiveHash::Associations
  has_many :variable_costs
end
