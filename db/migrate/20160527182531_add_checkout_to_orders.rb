class AddCheckoutToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :checkout, :boolean, default: false
  end
end
