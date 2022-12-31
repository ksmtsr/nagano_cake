class Public::CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.find(params[:id])
    customer.save!
    redirect_to customers_information_edit_path
  end

  def show
    @customer = Customer.find(params[:id])
  end


  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :email, :postal_code,:address, :telephon_number, :is_deleted )
  end

end
