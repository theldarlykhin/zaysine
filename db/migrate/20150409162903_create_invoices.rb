class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
       t.string :invoice_number
       t.string :customer_email
       t.string :item_name
       t.string :price

       t.timestamps
    end
  end
end
