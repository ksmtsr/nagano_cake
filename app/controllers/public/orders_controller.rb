class Public::OrdersController < ApplicationController

  def confirm
    @order = Order.new
  end
end
