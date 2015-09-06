class Merchants::SessionsController < Devise::SessionsController


  	def after_sign_out_path_for(merchants)
  		merchant_session_path
  	end



  	def after_sign_in_path_for(merchants)
  	 	if current_merchant.approved == "t" && current_merchant.store_name == nil
	  	   	return new_merchant_info_path
      elsif current_merchant.approved == "t" && current_merchant.store_name != nil
          return products_path
	  	else
	  	   	return not_approve_path
	  	end
  	end

    






  


end
