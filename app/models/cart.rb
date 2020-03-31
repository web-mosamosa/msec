class Cart < ApplicationRecord
	# belongs_to :item
	has_many :cart_items
	belongs_to :user
end
