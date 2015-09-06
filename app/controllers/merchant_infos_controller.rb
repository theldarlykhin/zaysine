class MerchantInfosController < ApplicationController
  before_action :set_merchant_info, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @merchant_infos = MerchantInfo.all
    respond_with(@merchant_infos)
  end

  def show
    respond_with(@merchant_info)
  end

  def new
    @merchant_info = MerchantInfo.new
    respond_with(@merchant_info)
  end

  def edit
  end

  def create
    @merchant_info = MerchantInfo.new(merchant_info_params)
    @merchant_info.save
    redirect_to dashboards_path
  end

  def update
    @merchant_info.update(merchant_info_params)
    respond_with(@merchant_info)
  end

  def destroy
    @merchant_info.destroy
    respond_with(@merchant_info)
  end

  private
    def set_merchant_info
      @merchant_info = MerchantInfo.find(params[:id])
    end

    def merchant_info_params
      params.require(:merchant_info).permit(:name, :account_email, :customer_email, :storename, :phone, :street, :city, :postal)
    end
end
