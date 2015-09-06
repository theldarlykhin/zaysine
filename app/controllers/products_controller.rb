class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  layout "backend"
  layout :layout_per_action
  before_action :authenticate_merchant!, only: [:show, :edit, :update, :destroy, :index, :new]
  before_action :authenticate_customer!, only: [:buy_from_post]
  # before_filter :is_approve?, except: [:my_product]
  # GET /merchants
  # GET /merchants.json
  def index
    @products = Product.where(:store_id => current_merchant.store_name)
  end


  def my_product
    @cart = current_cart

    # session[:signed_request] = params[:signed_request] if params[:signed_request]
    # encoded_user_data = session[:signed_request]
    # raw_app_data = encoded_user_data.split(".")[1]  
    # @base_data = Base64.decode64(raw_app_data)
    # @json_data = JSON.parse(@base_data)
    
    # @my_json_data = @json_data["page"]
    # @app_data = @my_json_data["id"]
     
    @products = Product.all

    @line_items = LineItem.all


 
  end

  # GET /merchants/1
  # GET /merchants/1.json
  def show
  end

  def buy_from_post
      @product = Product.find(params[:id])
  end

  # GET /merchants/new
  def new
    @product = Product.new
  end

  # GET /merchants/1/edit
  def edit
  end

  # POST /merchants
  # POST /merchants.json
  def create
    @product = Product.new(product_params)


    # @option_arrs = params[:product][:size].split(',') 
    # @option_arrs[0] 
    

    respond_to do |format|

      if @product.save
        format.html { redirect_to products_url, notice: 'Product was successfully save.' }
        format.json { render :show, status: :created, location: @product }
        
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchants/1
  # PATCH/PUT /merchants/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchants/1
  # DELETE /merchants/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:page,:product_name,:brand_id,:category_id,:desc,:avatar,:inventory,:store_id,:price,:inventory_policy,:sku,:token,option_value: [],  option_name: [])
    end


    def layout_per_action
      if action_name == "my_product"
           false
      elsif action_name == "buy_from_post"
           false
      else
          "backend"
      end
    end
end
