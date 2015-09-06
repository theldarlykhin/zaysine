class Admins::SessionsController < Devise::SessionsController



  	def after_sign_out_path_for(admins)
  		admin_session_path
  	end

  	def after_sign_in_path_for(admins)
  	 	merchants_path
  	end

  


end
