class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts,dependent: :destroy
  has_many :residences,dependent: :destroy
  has_many :orders, dependent: :destroy

  enum user_status: {
    有効: "uraura_withdraw",
    退会済み: "ura_withdraw",
  }

  #def active_for_authentication?  
   # super && !deleted_at
  #end  

  validates :first_name, :last_name,  presence: true
  validates :email, presence: true
  validates :first_name_kana, :last_name_kana, presence: true
  validates :postcode, length: {minimum: 7, maximum: 7 }
  validates :phone_number, length: {in:10..11 }
  validates :password, length: {minimum: 6 }

  
end


