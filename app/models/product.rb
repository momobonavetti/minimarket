class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  validates :name, :image_url, :price, :stock, :presence => true

end
