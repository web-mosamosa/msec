class Item < ApplicationRecord
	has_many :cart_items
	has_many :order_items
	belongs_to :category, optional: true
	attachment :profile_image
end
