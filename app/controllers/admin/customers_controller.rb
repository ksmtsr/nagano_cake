class Admin::CustomersController < ApplicationController

def index
  @customers = Customer.all
end

def show
  @customer = Customer.find(params[:id])
end

def edit
  @customer = Customer.find(params[:id])
end

def update
  customer = Customer.find(params[:id])
  customer.update(customer_params)
  redirect_to admin_customers_path(customer.id)
end




private

  def item_params
    params.require(:customer).permit(:first_name, :last_name, :email, :is_deleted )
  end

end
