class AddDescToStore < ActiveRecord::Migration
  def change
  	add_column :stores, :store_desc, :text
  	add_column :stores, :merchant_id, :integer
  	add_column :stores, :owner_name, :string
  	add_column :stores, :customer_email, :string
  end
end
