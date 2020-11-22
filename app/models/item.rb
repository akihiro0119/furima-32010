class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :freight
  belongs_to :area
  belongs_to :shipdate
  has_one_attached :image
  belongs_to :user

  validates :image, presence: true
  validates :title, presence: true, length:{maximum: 40 }
  validates :explanation, presence: true,length:{maximum: 1000 }

  with_options numericality: {other_than: 1 } do
    validates :category_id 
    validates :status_id 
    validates :freight_id 
    validates :area_id
    validates :shipdate_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end

