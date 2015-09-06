class InvoiceMailer < ActionMailer::Base
  default from: "ghostrider.766@gmail.com"
 
  def welcome_email(invoice)
    @invoice = invoice
    @url  = 'http://example.com/payment'
    mail(to: @invoice.customer_email, subject: 'Welcome to ZaySine')
  end
end
