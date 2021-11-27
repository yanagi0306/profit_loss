require 'rails_helper'

RSpec.describe Income, type: :model do
  before do
    store = FactoryBot.create(:store)
    achievement = FactoryBot.create(:achievement)
    @income = FactoryBot.build(:income,store_id:store.id,achievement_id:1)
  end
  describe '臨時収入規登録' do
    context '登録できる場合' do
     it '正しい数値が入力されている' do
      expect(@income).to be_valid
     end
    end
    context '登録できない場合' do


    end
  end
end
