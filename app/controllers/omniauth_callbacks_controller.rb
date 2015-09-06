class OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def facebook
   
    if request.env["omniauth.params"]["user"] == "merchant"

        @merchant = Merchant.from_omniauth_merchant(request.env["omniauth.auth"])
        if @merchant.persisted?
          sign_in_and_redirect @merchant, :event => :authentication 
          set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
        else
          session["devise.facebook_data"] = request.env["omniauth.auth"]
          redirect_to new_user_registration_url
        end

    else

        @customer = Customer.from_omniauth_customer(request.env["omniauth.auth"])
        if  @customer.persisted?
          sign_in_and_redirect @customer, :event => :authentication
          set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
        else
          session["devise.facebook_data"] = request.env["omniauth.auth"]
          redirect_to new_user_registration_url
        end

    end
  end



  def after_sign_in_path_for(merchant)

      if current_merchant.nil?
          return new_shipping_info_path
      elsif current_merchant.store_name == nil
          return new_merchant_info_path
      elsif current_merchant.store_name != nil && current_merchant != nil
          return products_path
      elsif current_merchant.store_name != nil && current_customer != nil
          return new_shipping_info_path
      else
          return not_approve_path
      end
  end





end