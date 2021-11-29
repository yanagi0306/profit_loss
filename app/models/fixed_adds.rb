class FixedAdds < ActiveHash::Base
 self.data = [
   { id: 0, name: 'communications_variable', ja_name: '通信費変動' },
   { id: 1, name: 'publicity_variable', ja_name: '広告変動' },
   { id: 2, name: 'garbage_variable', ja_name: 'ゴミ処理変動' },
   { id: 3, name: 'car_variable', ja_name: '車両費変動' },
   { id: 4, name: 'credit_variable', ja_name: 'クレジット変動' },
   { id: 5, name: 'clean_variable', ja_name: '衛生管理変動' },
 ]
 end
