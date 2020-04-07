class Residence < ApplicationRecord
	validates :postcode, presence: true
	validates :address, presence: true
	validates :name, presence: true
	belongs_to :user


	def postcode_and_address_and_name
		self.postcode + address + name
	end
 
end
