class Residence < ApplicationRecord
	validates :postcode, presence: true
	validates :address, presence: true
	validates :name, presence: true
	belongs_to :user
end
