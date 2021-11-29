class Utilities < ActiveHash::Base
self.data = [
  { id: 0, ja_name: '電気代' ,name:'electric'},
  { id: 1, ja_name: '水道代' ,name:'water'},
  { id: 2, ja_name: 'ガス代' ,name:'gas'},
  { id: 3, ja_name: '動力代' ,name:'power'},

]

end
