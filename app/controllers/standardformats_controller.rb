class StandardformatsController < ApplicationController
  before_action :set_standardformat, only: [:show, :edit, :update, :destroy]
  layout "backend"
  respond_to :html

  def index
    @standardformats = Standardformat.all
    respond_with(@standardformats)
  end

  def show
    respond_with(@standardformat)
  end

  def new
    @standardformat = Standardformat.new
    respond_with(@standardformat)
  end

  def edit
  end

  def create
    @standardformat = Standardformat.new(standardformat_params)
    @standardformat.save
    respond_with(@standardformat)
  end

  def update
    @standardformat.update(standardformat_params)
    respond_with(@standardformat)
  end

  def destroy
    @standardformat.destroy
    respond_with(@standardformat)
  end

  private
    def set_standardformat
      @standardformat = Standardformat.find(params[:id])
    end

    def standardformat_params
      params.require(:standardformat).permit(:suffix, :prefix, :timezone, :currency, :unitsystemstring, :defaultweightunit)
    end
end
