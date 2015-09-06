class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_filter  :verify_authenticity_token
  before_filter :my_store
  before_filter :set_headers
  after_filter :set_cors
  before_filter :set_access_control_headers
            
   def  set_access_control_headers
                    headers['Access-Control-Allow-Origin'] = '*'
                    headers['Access-Control-Request-Method'] = '*'
                    headers['Access-Control-Allow-Headers'] = '*'
                    headers['Access-Control-Allow-Credentials'] = "true"
  end

  def set_cors
    headers['Access-Control-Request-Method'] = '*'
  end

	  protected
	  def my_store
	  	   if current_merchant != nil
	  	   @my_stores = Store.where(:merchant_id => current_merchant.id)
	  	   else
	  	   	@my_stores = Store.all
	  	   end
	  end



	def is_approve?
    	redirect_to "/not_approve", error: 'You dont have enough permissions to be here' unless current_merchant.approved == "t"
    	return true
  	end


  	private
  	def current_cart

      Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
      
   end

    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Expose-Headers'] = 'ETag'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
      headers['Access-Control-Max-Age'] = '86400'
    end


  def reset_cart
     Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
      session[:cart_id] = nil
      cart
  end









	  

end
