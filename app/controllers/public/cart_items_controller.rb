class Public::CartItemsController < ApplicationController

  def index
    @cart_items = Cart_Item.all
  end


  private

  def order_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount )
  end

end
