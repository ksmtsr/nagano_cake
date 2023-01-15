class Public::AddressesController < ApplicationController

  def new
    @address = current_customer.address
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save!
    redirect_to addresses_path
  end

  def index
    @new_address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = current_customer.address
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end


  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :receiver_address, :postal_code )
  end

end
