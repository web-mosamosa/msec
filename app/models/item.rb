class Item < ApplicationRecord
	has_many :carts,dependent: :destroy
	has_many :order_items,dependent: :destroy
	belongs_to :category, optional: true
	has_many :orders,through: :order_items
	attachment :profile_image
end
