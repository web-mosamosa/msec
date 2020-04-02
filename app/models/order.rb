class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items,dependent: :destroy
	has_many :items,through: :order_items
	enum pay: {クレジットカード: 0, 銀行振込: 1}
end
