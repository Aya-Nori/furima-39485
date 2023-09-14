class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :region
  belongs_to :estimate

  # 商品出品時に商品名、商品の説明、画像、価格がない場合は、保存できない。
  validates :name, :description, :price, presence: true
  validates :price, numericality: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/i }

  # アクティブハッシュの選択肢は必ず選ぶこと。
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :estimate_id, numericality: { other_than: 1, message: "can't be blank" }
end
