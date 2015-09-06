class MerchantInfo < ActiveRecord::Base


	 after_save :save_to_store

	 private
	  def save_to_store
       
            store_name = self.storename
			store_contact = self.phone
			store_address = self.street
			store_owner = self.account_email
            store = Store.create(

            		    :name => store_name,
					    :phone => store_contact,
					    :street => self.street,
					    :city  => self.city,
					    :postal => self.postal,
					    :merchant_id => store_owner,
					    :customer_email => self.customer_email


            	)


        
            @merchant = Merchant.find(store_owner)
            @merchant.update(
                    :store_name =>  self.storename
                    )

   



    end

end
