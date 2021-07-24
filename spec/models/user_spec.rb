require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目に値が存在していれば登録出来る' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
      it '名前と性は全角であれば登録出来る' do
        @user.last_name = 'あ亜'
        @user.first_name = 'あ亜'
        expect(@user).to be_valid
      end
      it '名前と性のフリガナはカタカナであれば登録出来る' do
        @user.last_name_kana = 'ア'
        @user.first_name_kana = 'ア'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが@無しだと登録ができない' do
        @user.email = 'aaaa1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it '名前は空がだと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '性は空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名前のフリガナは空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '性のフリガナは空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '名前は全角がないと登録できない' do
        @user.last_name = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it '性は全角がないと登録できない' do
        @user.first_name = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it '名前のフリガナはカタカナでないと登録できない' do
        @user.last_name_kana = 'あa1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it '性のフリガナはカタカナでないと登録できない' do
        @user.first_name_kana = 'あa1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'パスワードが半角英字のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが半角数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが全角では登録できないこと' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '誕生日が空の場合登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
