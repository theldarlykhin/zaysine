class Merchant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  STATUS = ["Confirm","Unconfirm"]
  
  has_many :stores

		def self.from_omniauth_merchant(auth)
		  where(provider: auth.provider, uid: auth.uid).first_or_create do |merchant|
		    merchant.email = auth.info.email
		    merchant.password = Devise.friendly_token[0,20]
		  end
		end





   	


end
