require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー管理機能' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: 'aaaaaaa11111', password_confirmation: 'aaaaaaa11111',last_name:'あ',first_name:'い',last_name_kana:'ウ',first_name_kana:'エ',birthday:'1964-10-25')
      # インスタンスの作成　カラムと入力したい内容を記述
      user.valid?
      # 作ったインスタンスがバリデーションを通っているか確認　通っている→true　通ってない→False
      # user.errors.full_messages
      # エラーメッセージの内容確認
      expect(user.errors.full_messages).to include("Nickname can't be blank")
      # 確認したエラーメッセージと合致しているか確認
    end
    it 'emailが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
  end
end