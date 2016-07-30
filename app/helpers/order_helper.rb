module OrderHelper
  def too_many?
    current_user.cart_items.find do |order|
      order.quantity > order.product.remaining_qty
    end
  end
end
