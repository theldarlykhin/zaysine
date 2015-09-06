class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_merchant!, only: [:show, :edit, :update, :destroy, :index]
  layout :layout_per_action
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  def my_checkout

    @cart = current_cart
    @line_items = LineItem.where("cart_id = ? ", current_cart)
    @full_name = params[:full_name]
    @contact_number = params[:contact_number]
    @email = params[:email]
    @city = params[:city]
    @township = params[:township]
    @shipping_address = params[:shipping_address]

    time = Time.new
    @invoice_number = time.year.to_s+time.min.to_s+time.min.to_s+time.sec.to_s


    @total = 0;

    @rate = 0;
    @convenience_fee = 0;
    @line_items.each do |line_item|

        @store_id = line_item.product.store_id
        @item_price = line_item.product.price;
        @total = @item_price + @total;

    end


        @shipping_rates = ShippingRate.where("store_id = ?", @store_id)
          @shipping_rates.each do |shipping_rate|
            @paid_method = shipping_rate.paid_method;
              if @paid_method == "paid_all_by_customer"
                @rate = shipping_rate.rate;
              elsif @paid_method == "paid_by_merchant_if_purchase_amount_is"
                if @total < shipping_rate.amount.to_i
                  @rate = shipping_rate.rate;
                end
              end
          end
        @total = @rate.to_i +  @total;

          @shipping_rates.each do |shipping_rate|
            @paid_method_for_convenience_fee = shipping_rate.paidmethod_for_convenience_fee;
              if @paid_method_for_convenience_fee == "paid_all_by_customer"
                @convenience_fee = shipping_rate.convenience_fee;
              elsif @paid_method_for_convenience_fee == "paid_by_merchant_if_purchase_amount_is"
                if @total < shipping_rate.amount_for_convenience_fee.to_i
                  @convenience_fee = shipping_rate.convenience_fee;
                end
              end
          end
        @total = @convenience_fee.to_i + @total;


    key = 'VUPPfF8isnhH'
    @version = "6.0";
    @merchant_id = "MM0003";
    @payment_description = "";
    @order_id = "00000000000000123456";
    @invoice_no = @invoice_number;
    @currency = "";
    # @amount = "000000010000";
    if @total.to_s.length == 1
      @concattotal = "000000000" + @total.to_s
    elsif @total.to_s.length == 2
      @concattotal = "00000000" + @total.to_s
    elsif @total.to_s.length == 3
      @concattotal = "0000000" + @total.to_s
    elsif @total.to_s.length == 4
      @concattotal = "000000" + @total.to_s
    elsif @total.to_s.length == 5
      @concattotal = "00000" + @total.to_s
    elsif @total.to_s.length == 6
      @concattotal = "0000" + @total.to_s
    elsif @total.to_s.length == 7
      @concattotal = "000" + @total.to_s
    elsif @total.to_s.length == 8
      @concattotal = "00" + @total.to_s
    elsif @total.to_s.length == 9
      @concattotal = "0" + @total.to_s
    elsif @total.to_s.length == 10
      @concattotal = @total.to_s
    end

    @amount = @concattotal.to_s+"00";
    @customer_email = params[:email];
    @pay_category_id = "";
    @promotion = "";
    @user_defined_1 = "";
    @user_defined_2 = "";
    @user_defined_3 = "";
    @user_defined_4 = "";
    @user_defined_5 = "";
    @result_url_1 = "";
    @result_url_2 = "";
 

    data = @version+@merchant_id+@payment_description+@order_id+@invoice_no+@currency+@amount+@customer_email+@pay_category_id+@promotion+@user_defined_1+@user_defined_2+@user_defined_3+@user_defined_4+@user_defined_5+@result_url_1+@result_url_2;
    digest = OpenSSL::Digest.new('sha1')
    hmac = OpenSSL::HMAC.hexdigest(digest, key, data)
    @aok = hmac

  end

  def sent_to_order
    Order.create(
      :customer_name => params[:customer_name],
      :customer_phone => params[:customer_phone],
      :customer_email  => params[:customer_email],
      :customer_city  => params[:customer_city],
      :customer_township  => params[:customer_township],
      :customer_address => params[:customer_address],
      :purchase_item => params[:purchase_item]
      )
     session[:cart_id] = nil
     redirect_to "https://www.facebook.com/fcomtest/app_404381443062412?ref=page_internal"
  end



  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:store_id, :customer_name, :customer_phone, :customer_email, :customer_city, :customer_township, :customer_address,  purchase_item: [])
    
      
    end


    def layout_per_action
      if action_name == "my_checkout"
           false
      else
          "backend"
      end
    end

end
