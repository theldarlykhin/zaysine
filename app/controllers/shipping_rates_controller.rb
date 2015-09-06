class ShippingRatesController < ApplicationController
  before_action :set_shipping_rate, only: [:show, :edit, :update, :destroy]
  layout "backend"
  respond_to :html

  def index
    @shipping_rates = ShippingRate.all
    respond_with(@shipping_rates)
  end

  def show
    respond_with(@shipping_rate)
  end

  def new
    @shipping_rate = ShippingRate.new
    respond_with(@shipping_rate)
  end

  def edit
    
  end

  def create
    @shipping_rate = ShippingRate.new(shipping_rate_params)
    @shipping_rate.save
    respond_with(@shipping_rate)
  end

  def update
    @shipping_rate.update(shipping_rate_params)
    respond_with(@shipping_rate)
  end

  def destroy
    @shipping_rate.destroy
    respond_with(@shipping_rate)
  end

  private
    def set_shipping_rate
      @shipping_rate = ShippingRate.find(params[:id])
    end

    def shipping_rate_params
      params.require(:shipping_rate).permit(:rate, :amount, :paid_method, :store_id, :convenience_fee, :paidmethod_for_convenience_fee, :amount_for_convenience_fee)
    end
end
