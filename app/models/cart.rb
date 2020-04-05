class Cart < ApplicationRecord
  belongs_to :item
  belongs_to :user

  def self.total_price
    carts = Cart.all
    value = 0
    carts.each do |c|
      value += c.item.price.to_i * c.count.to_i
    end
    return value
  end

end
