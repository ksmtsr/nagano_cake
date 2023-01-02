class Public::OrdersController < ApplicationController

  def confirm
    @order = Order.new
  end


  private

  def order_params
    params.require(:order).permit(:item_id, :order_id, :tax_included_price, :amount, :making_status )
  end

end
