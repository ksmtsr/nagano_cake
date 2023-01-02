class Admin::OrdersController < ApplicationController

  def show
    @orders = Orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:item_id, :order_id, :tax_included_price, :amount, :making_status )
  end

end
