class Miscellaneous < ActiveHash::Base
  self.data = [
    { id: 0, ja_name: '社員残業代' ,name:"overtime_employee_cost"},
    { id: 1, ja_name: 'P社会保険' ,name:"social_insurance_part"},
    { id: 2, ja_name: '会議費' ,name:"meeting"},
    { id: 3, ja_name: '旅費交通費' ,name:"traveling"},
    { id: 4, ja_name: '販売管理費' ,name:"selling_administration_cost"},
    { id: 5, ja_name: '受取利息' ,name:"interest_payment"},
  ]

  end
