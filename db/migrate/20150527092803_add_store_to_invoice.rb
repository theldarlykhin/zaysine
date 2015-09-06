class AddStoreToInvoice < ActiveRecord::Migration
  def change
  	  add_column :invoices, :store_name, :string  
  end
end
