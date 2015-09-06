class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  layout "backend"
  before_action :authenticate_merchant!, only: [:show, :edit, :update, :destroy, :index, :new]

  # GET /merchants
  # GET /merchants.json
  def index
    @brands = Brand.all
  end

  # GET /merchants/1
  # GET /merchants/1.json
  def show
  end

  # GET /merchants/new
  def new
    @brand = Brand.new
  end

  # GET /merchants/1/edit
  def edit
  end

  # POST /merchants
  # POST /merchants.json
  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to brands_url, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchants/1
  # PATCH/PUT /merchants/1.json
  def update
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to brands_url, notice: 'Brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @brand }
      else
        format.html { render :edit }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchants/1
  # DELETE /merchants/1.json
  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to brands_url, notice: 'Brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brand_params
      params.require(:brand).permit(:brand_name)
    end
end
