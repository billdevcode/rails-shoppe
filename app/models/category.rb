class Category < ActiveRecord::Base
  has_many :catalogs
  has_many :products, through: :catalogs

  validates :name, presence: true
end
