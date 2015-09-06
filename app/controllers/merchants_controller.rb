class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :edit, :update, :destroy]
  layout :layout_per_action
  before_action :authenticate_admin!, only: [:unapproved_merchants, :index]
  
  # GET /merchants
  # GET /merchants.json
  def index
    @merchants = Merchant.where(:approved => "t")
  end

  def unapproved_merchants
    @merchants = Merchant.where(:approved => "f")
  end

  def confirm_merchant
    respond_to do |format|
      @merchant = Merchant.find(params[:id])
      if @merchant.update(:approved => "t")
        format.html { redirect_to merchants_path }
        format.json { render :show, status: :ok, location: @merchant }
      else
        format.html { render :edit }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  def unconfirm_merchant
    respond_to do |format|
      @merchant = Merchant.find(params[:id])
      if @merchant.update(:approved => "f")
        format.html { redirect_to merchants_path }
        format.json { render :show, status: :ok, location: @merchant }
      else
        format.html { render :edit }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end



  # GET /merchants/1
  # GET /merchants/1.json
  def show
  end

  # GET /merchants/new
  def new
    @merchant = Merchant.new
  end

  # GET /merchants/1/edit
  def edit
  end

  # POST /merchants
  # POST /merchants.json
  def create
    @merchant = Merchant.new(merchant_params)

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to @merchant, notice: 'Merchant was successfully created.' }
        format.json { render :show, status: :created, location: @merchant }
      else
        format.html { render :new }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchants/1
  # PATCH/PUT /merchants/1.json
  def update
    respond_to do |format|
      if @merchant.update(merchant_params)
        format.html { redirect_to @merchant, notice: 'Merchant was successfully updated.' }
        format.json { render :show, status: :ok, location: @merchant }
      else
        format.html { render :edit }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchants/1
  # DELETE /merchants/1.json
  def destroy
    @merchant.destroy
    respond_to do |format|
      format.html { redirect_to merchants_url, notice: 'Merchant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def layout_per_action
    if action_name == "index" 
      "backend"
    elsif action_name == "unapproved_merchants"
      "backend"
    else
      "application"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchant_params
      params.require(:merchant).permit(:approved)
    end
end
