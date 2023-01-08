class Public::CustomersController < ApplicationController

  def new
    @customer = current_customer
  end

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
      if @customer == current_customer
            render "edit"
      else
            redirect_to customer_path
      end
  end

  def update
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :email, :postal_code,:address, :telephon_number, :is_deleted )
  end

end
