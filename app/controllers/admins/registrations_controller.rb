class Admins::RegistrationsController < Devise::RegistrationsController
  

  	def after_sign_in_path_for(admins)
	  	merchants_path
  	end
  	

end



