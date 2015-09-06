class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  layout :layout_per_action
  respond_to :html
  require "uri"
  require "net/http"
  require 'net/https'



  def index
    @invoices = Invoice.where(:store_name => current_merchant.store_name)
    respond_with(@invoices)
    
  end

  def show
    #  @invoice = Invoice.find_by_random_id(params[:random_id])
    # respond_with(@invoice)
  end

  def new
    @invoice = Invoice.new
    respond_with(@invoice)
  end

  def edit
  end


   

  def pay_fast
      require "uri"
      require "net/http"
      require 'net/https'


    @invoice = Invoice.find_by_random_id(params[:random_id])

    key = 'VUPPfF8isnhH'
    @version = "6.0";
    @merchant_id = "MM0003";
    @payment_description = "";
    @order_id = "00000000000000123456";
    @invoice_no = @invoice.invoice_number;
    @currency = "";
    # @amount = "000000010000";
    if @invoice.price.to_s.length == 1
      @concattotal = "000000000" + @invoice.price.to_s
    elsif @invoice.price.to_s.length == 2
      @concattotal = "00000000" + @invoice.price.to_s
    elsif @invoice.price.to_s.length == 3
      @concattotal = "0000000" + @invoice.price.to_s
    elsif @invoice.price.to_s.length == 4
      @concattotal = "000000" + @invoice.price.to_s
    elsif @invoice.price.to_s.length == 5
      @concattotal = "00000" + @invoice.price.to_s
    elsif @invoice.price.to_s.length == 6
      @concattotal = "0000" + @invoice.price.to_s
    elsif @invoice.price.to_s.length == 7
      @concattotal = "000" + @invoice.price.to_s
    elsif @invoice.price.to_s.length == 8
      @concattotal = "00" + @invoice.price.to_s
    elsif @invoice.price.to_s.length == 9
      @concattotal = "0" + @invoice.price.to_s
    elsif @invoice.price.to_s.length == 10
      @concattotal = @invoice.price.to_s
    end

    @amount = @concattotal.to_s+"00";
    @customer_email = @invoice.customer_email;
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
    @hash_value = hmac

    params = {
          'version' => '6.0',
          'merchant_id' => 'MM0003',
          'payment_description' => "",
          'order_id' => '00000000000000123456',
          'invoice_no' => @invoice_no,
          'currency' => "",
          'amount' => @amount,
          'customer_email' => @customer_email,
          'pay_category_id' => "",
          'promotion' => "",
          'user_defined_1' => "",
          'user_defined_2' => "",
          'user_defined_3' => "",
          'user_defined_4' => "",
          'user_defined_5' => "",
          'result_url_1' => "",
          'result_url_2' => "",
          'hash_value' => @hash_value,
          'button1' => 'Submit'
          
    }

 
      # x = Net::HTTP.post_form(URI.parse('https://demo2.2c2p.com/2C2PFrontEnd/RedirectV3/payment'), params)
      # puts x.body
   
  end

  

  def create
    @invoice = Invoice.new(invoice_params)
 
    respond_to do |format|
      
      if @invoice.save
        # Tell the UserMailer to send a welcome email after save
        # InvoiceMailer.welcome_email(@invoice).deliver
 
        format.html { redirect_to(@invoice, notice: 'Invoice was successfully created.') }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @invoice.update(invoice_params)
    respond_with(@invoice)
  end

  def destroy
    @invoice.destroy
    respond_with(@invoice)
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:store_name, :random_id,:invoice_number, :customer_email, :item_name, :price)
    end

    def layout_per_action
      if action_name == "pay_fast"
           "application"
      else
        "backend"
      end
    end
end

