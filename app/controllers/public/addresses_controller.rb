class Public::AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.find(params[:id])
  end

  def index
    @address = Address.find(params[:id])
  end


  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :address, :postal_code )
  end

end
