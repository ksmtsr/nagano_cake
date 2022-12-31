class Public::HomesController < ApplicationController

  def top
    @item = Item.all
  end

 def create
  item = Item.new(item_params)
  item.save!
  redirect_to admin_items_path
 end

end
