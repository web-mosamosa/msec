class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts,dependent: :destroy
  has_many :addresses,dependent: :destroy
  has_many :orders, dependent: :destroy
  



  


  validates :first_name, length: {maximum: 20, minimum: 2}
  validates :last_name, length: {maximum: 20, minimum: 2}
  validates :first_name_kana, length: {maximum: 20, minimum: 2}
  validates :last_name_kana, length: {maximum: 20, minimum: 2}
  validates :address, length: {maximum: 50}
  validates :phone_number, length: {minimum: 8}
  validates :postcode, length: {minimum: 7}
  validates :email, length: {minimum: 4}

end


