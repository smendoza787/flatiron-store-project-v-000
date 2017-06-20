class LineItemsController < ApplicationController
  def create
    if current_user.current_cart.nil?
      current_user.set_current_cart
    end
    cart = current_user.current_cart
    item = Item.find(params[:item_id])
    if cart.items.include?(item)
      line_item = cart.line_items.find_by(item_id: item.id)
      add_qty = line_item.quantity + 1
      line_item.update(quantity: add_qty)
    else
      line_item = cart.add_item(item.id)
    end

    if line_item.save
      redirect_to cart
    end
  end
end
