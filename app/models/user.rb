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

  
end


