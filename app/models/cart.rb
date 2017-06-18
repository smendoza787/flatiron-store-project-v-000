class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    items.each do |item|
      total += item.price
    end
    total
  end

  def add_item(item_id)
    if lineitem = line_items.find_by(id: item_id)
      new_quantity = lineitem.quantity + 1
      lineitem.update(quantity: new_quantity)
      lineitem
    else
      item = Item.find_by(id: item_id)
      line_items.new(quantity: 1, item: item)
    end
  end
end
