class Public::OrdersController < ApplicationController

    def new
      @customer = current_customer
      @order = Order.new
    end

    def create
      @order = Order.new(order_params)
      @order.save
      redirect_to orders_complete_path
    end

    def index
      @orders = current_customer.orders
    end

    def confirm
      @order =  Order.new(order_params)
      @cart_items = CartItem.all
      @customer = current_customer
      @total = 0
      params[:order][:select_address]
      if params[:order][:select_address] == "1"
        @order.postal_code = @customer.postal_code
        @order.address = @customer.address
        @order.name = @customer.full_name
      elsif params[:order][:select_address] == "2"
        @order.address = @address.address
        #@order. =
      end

      #@address = Address.find(params[:order][:address_id])
      #@order.postal_code = @address.postal_code
      #@order.address = @address.address
      #@order.name = @address.name
    end

    def show
      @item = Item.find(params[:id])
      @order = Order.find(params[:id])
    end

    private

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :last_name, :first_name, :address, :telephone_number, :customer_id, :name, :created_at)
    end

end