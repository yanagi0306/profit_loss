class Targets < ActiveHash::Base
  self.data = [
    { id: 0, name: '毎日入力' },
    { id: 1, name: '光熱費' },
    { id: 2, name: '固定費追加分' },
    { id: 3, name: 'その他' },
  ]

  end
