require 'rails_helper'

RSpec.describe Company, type: :model do
  before { @company = FactoryBot.build(:company) }

  describe '会社新規登録' do
    context '新規登録できる場合' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@company).to be_valid
      end
      it 'パスワードが６文字以上' do
        @company.password = 'aaaaaaaaaa'
        @company.password_confirmation = 'aaaaaaaaaa'
        expect(@company).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @company.name = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Name can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @company.password = 'aaaaa'
        @company.password_confirmation = 'aaaaa'
        @company.valid?
        expect(@company.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @company.password = 'bbbbbb'
        @company.valid?
        expect(@company.errors.full_messages).to include("Password confirmation doesn't match Password")

      end
      it 'emailが空では登録できない' do
        @company.email = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @company.password = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Password can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @company.save
        company1 = FactoryBot.build(:company, email: @company.email)

        company1.valid?
        expect(company1.errors.full_messages).to include('Email has already been taken')
      end
    end
  end
end
