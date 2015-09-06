class ShippingInfosController < ApplicationController
  before_action :set_shipping_info, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_customer!, only: [:new]
  layout :layout_per_action
  respond_to :html

  def index
    @shipping_infos = ShippingInfo.all
    respond_with(@shipping_infos)
  end

  def show
    respond_with(@shipping_info)
  end

  def new
    @shipping_info = ShippingInfo.new
    respond_with(@shipping_info)
  end

  def edit
  end

  def create
    @shipping_info = ShippingInfo.new(shipping_info_params)
    @shipping_info.save
    redirect_to my_checkout_path(@shipping_info, 
    { :full_name => @shipping_info.full_name, 
      :contact_number => @shipping_info.contact_number,
      :email  => @shipping_info.email,
      :city  => @shipping_info.city,
      :township  => @shipping_info.township,
      :shipping_address  => @shipping_info.shipping_address

    })
  end

  def update
    @shipping_info.update(shipping_info_params)
    respond_with(@shipping_info)
  end

  def destroy
    @shipping_info.destroy
    respond_with(@shipping_info)
  end

  private
    def set_shipping_info
      @shipping_info = ShippingInfo.find(params[:id])
    end

    def shipping_info_params
      params.require(:shipping_info).permit(:full_name, :contact_number, :email, :city, :township, :shipping_address)
    end

    def layout_per_action
      if action_name == "new"
           false
      else
          "backend"
      end
    end
end
