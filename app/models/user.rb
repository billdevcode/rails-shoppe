class User < ActiveRecord::Base
  include BCrypt

  has_many :orders
  validates :username, :password, :email, presence: true
  validates :username, :email, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = password
  end

  def order_history
    self.orders.where(checkout: true)
  end

  def cart_items
    self.orders.where(checkout: false)
  end

  def order_sum
    sum = 0
    cart_items.each do |order|
      sum += (order.quantity * order.product.price)
    end
    sum
  end

end
