class Public::OrdersController < ApplicationController

    def confirm
      @orders = current_customer_oder
    end

    def show
      @orders = Order.find(params[:id])
    end

    private

    def order_params
    params.require(:order).permit(:customer_id, :payment_method, :amount, :postage, :postal_code, :address, :name,:status )
    end

end