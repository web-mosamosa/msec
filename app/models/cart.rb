class Cart < ApplicationRecord
  belongs_to :item
  belongs_to :user

  def self.total_price
    carts = Cart.all
    value = 0
    carts.each do |c|
      value += ((c.item.price.to_i * 1.1).round(2)).ceil.to_i.to_i * c.count.to_i
    end
    return value
  end
  def self.sum_price
    sum = 0
    sum += Cart.total_price
    return sum
    end
end
