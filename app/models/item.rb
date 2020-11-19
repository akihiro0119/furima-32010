class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :freight
  belongs_to :area
  belongs_to :shipdate
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :freight_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :shipdate_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}


end
