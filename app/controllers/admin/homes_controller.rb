class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @order = current_customer
    @customer = current_customer
  end



private

end