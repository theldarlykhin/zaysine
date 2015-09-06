class AddRandomToInvoice < ActiveRecord::Migration
  def change
  	add_column :invoices, :random_id, :string
  end
end
