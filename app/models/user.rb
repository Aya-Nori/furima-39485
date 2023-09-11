class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth, presence: true

  validates :password, confirmation: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :name_sei, presence: true
    validates :name_mei, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カナを使用してください' } do
    validates :name_sei_kana, presence: true
    validates :name_mei_kana, presence: true
  end
end
