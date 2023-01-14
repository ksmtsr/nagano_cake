class Admin::OrdersController < ApplicationController

  def show
    @order = Order.new
    @order = current_customer
  end

  def order_params
    params.require(:order).permit(:customer_id, :item_id, :order_id, :tax_included_price, :amount, :making_status )
  end

end
