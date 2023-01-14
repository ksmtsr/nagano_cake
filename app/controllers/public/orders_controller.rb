class Public::OrdersController < ApplicationController

    def new
      @customer = current_customer
      @order = Order.new
    end

    def index
      @orders = current_customer.orders
    end

    def confirm
      @order =  Order.new(order_params)
      @cart_items = current_customer.cart_items
      @customer = current_customer
      @total = 0

      #@address = Address.find(params[:order][:address_id])
      #@order.postal_code = @address.postal_code
      #@order.address = @address.address
      #@order.name = @address.name
    end

    def show
      @order =  Order.new
      @order = Order.find(params[:id])
    end

    private

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :last_name, :first_name, :address, :telephone_number, :customer_id, :name, :created_at)
    end

end