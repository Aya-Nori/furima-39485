class Item < ApplicationRecord
  belongs_to :user
  # has_many :comments
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :region
  belongs_to :estimate

  # 商品出品時に商品名、商品の説明、画像、価格がない場合は、保存できない。
  validates :description, :image, :price, presence: true
  validates :price, numericality: { only_integer: true, in: 300..9_999_999 }
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :name, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end

  # アクティブハッシュの選択肢は必ず選ぶこと。
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :estimate_id, numericality: { other_than: 1, message: "can't be blank" }
end
