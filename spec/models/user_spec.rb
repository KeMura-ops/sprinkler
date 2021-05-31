require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it 'nickname,email,password, password_confirmationが存在すれば登録できる' do
        @user.nickname = "123456"
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationの値が同一であれば登録できる' do
        @user.password = "a12345"
        @user.password_confirmation = "a12345"
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したEmailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailが@を含んでいないと登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = 'test1234'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationの値が同一でなければ登録できない' do
        @user.password = 'test1234'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
