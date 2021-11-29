class Days < ActiveHash::Base
  self.data = [
    { id: 0, name:'food_cost',ja_name:'食材費' },
    { id: 1, name:"material_cost"  ,ja_name:'資材費'},
    { id: 2, name:"pert_cost"  ,ja_name:'P人件費'},
    { id: 3, name:"miscellaneous_cost",ja_name:'雑費' },
    { id: 4, name: "delivery_commission",ja_name:'デリバリー手数料' },
  ]

  end
