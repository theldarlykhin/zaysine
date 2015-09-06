class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

		def self.from_omniauth_customer(auth)
		  where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
		    customer.email = auth.info.email
		    customer.password = Devise.friendly_token[0,20]
		  end
		end




end
