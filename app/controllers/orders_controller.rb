require_relative '../pdfs/report_pdf.rb'

class OrdersController < ApplicationController
  include ApplicationHelper
  before_action :require_basic_login

  def index
    @orders = current_user.cart_items
    @sum = current_user.order_sum
  end

  def show
    @orders = current_user.order_history
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@orders)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end
  end

  def create
    @order = Order.new(order_params)
    @order.assign_attributes(user_id: current_user.id)

    if @order.quantity <= @order.product.remaining_qty
      repeat = false
      current_user.cart_items.each do |order|
        if order.product.id.to_s == order_params[:product_id]
          updated_quantity = order.quantity + @order.quantity
          order.update(quantity: updated_quantity)
          repeat = true
        end
      end
      unless repeat
        @order.save
      end
      respond_to do |format|
        format.html {redirect_to orders_path}
        format.text {render text: "<div class='alert alert-success'>Added #{@order.product.name} (#{@order.quantity}) to cart</div>"}
      end
    else
      flash[:error] = "Not enough quantity"
      respond_to do |format|
        format.html {redirect_to :back}
        format.text {render text: "<div class='alert alert-danger'>Not enough #{@order.product.name} in stock!</div>"}
      end

    end
  end

  def checkout
    @orders = current_user.cart_items
    @sum = current_user.order_sum
    @orders.each do |order|
      difference = order.product.remaining_qty - order.quantity
      order.product.update(remaining_qty: difference)
      order.update(checkout: true)
    end
  end

  def update

    # # current_user.orders.new(order_params)

  end

  def destroy

    @order = Order.find(params[:id])
    name = @order.product.name
    @order.destroy

    file = {
      text: "<div class='alert alert-success'>Removed #{name} from cart</div>",
      sum: current_user.order_sum
    }.to_json

    respond_to do |format|
      format.html {redirect_to :back}
      format.json {render json: file}
    end

  end

  private

  def order_params
    params.require(:order).permit(:quantity, :product_id)
  end

end
