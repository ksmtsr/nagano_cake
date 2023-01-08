class Public::AddressesController < ApplicationController

  def new
    @addresses = Address.new
  end

  def create
    @addresses = Address.find(params[:id])
  end


  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :address, :postal_code )
  end

end
