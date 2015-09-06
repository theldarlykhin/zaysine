class Merchants::RegistrationsController < Devise::RegistrationsController
  

 
   	def after_sign_in_path_for(merchants)
   		
   	  if current_merchant.store_name == nil
          return new_merchant_info_path
      elsif current_merchant.store_name != nil && current_merchant != nil
          return dashboards_path
      else
          return not_approve_path
      end

  	end
  	

end



