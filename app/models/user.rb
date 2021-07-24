class User < ApplicationRecord
  # ユーザー管理機能のモデル
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/ } do
      # 全角カナの区別
      validates :last_name_kana
      validates :first_name_kana
    end
    with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      # 全角かな/カナ漢字の区別
      validates :last_name
      validates :first_name
    end
  end
  # ユーザー管理機能に於いて、空を禁止する
  # validates :カラム名, バリデーションの種類
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # passwordの英数字混合の判断
  validates_format_of :password, with: PASSWORD_REGEX
end
