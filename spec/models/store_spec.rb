require 'rails_helper'

RSpec.describe Store, type: :model do
  before { @store = FactoryBot.build(:store) }

  describe '店舗新規登録' do
    context '新規登録できる場合' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@store).to be_valid
      end
      it 'パスワードが６文字以上' do
        @store.password = 'aaaaaaaaaa'
        @store.password_confirmation = 'aaaaaaaaaa'
        expect(@store).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @store.name = ''
        @store.valid?
        expect(@store.errors.full_messages).to include("Name can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @store.password = 'aaaaa'
        @store.password_confirmation = 'aaaaa'
        @store.valid?
        expect(@store.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @store.password = 'bbbbbb'
        @store.valid?
        expect(@store.errors.full_messages).to include("Password confirmation doesn't match Password")

      end
      it 'emailが空では登録できない' do
        @store.email = ''
        @store.valid?
        expect(@store.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @store.password = ''
        @store.valid?
        expect(@store.errors.full_messages).to include("Password can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @store.save
        store1 = FactoryBot.build(:store, email: @store.email)

        store1.valid?
        expect(store1.errors.full_messages).to include('Email has already been taken')
      end
      it 'opening_yearが空では登録できない' do
        @store.opening_year = ''
        @store.valid?
        expect(@store.errors.full_messages).to include("Opening year can't be blank")
      end
      it 'opening_yearが数字以外では登録できない' do
        @store.opening_year = "ああああ"
        @store.valid?
        expect(@store.errors.full_messages).to include("Opening year is not a number")
      end
    end
  end
end
