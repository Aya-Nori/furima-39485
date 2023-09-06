class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :name_sei, presence: true
  validates :name_mei, presence: true
  validates :name_sei_kana, presence: true
  validates :name_mei_kana, presence: true
  validates :birth, presence: true

end
