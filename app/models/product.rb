class Product < ActiveRecord::Base
  has_many :catalogs
  has_many :categories, through: :catalogs
  has_many :orders

  validates :name, :description, :price, :remaining_qty, presence: true
end
