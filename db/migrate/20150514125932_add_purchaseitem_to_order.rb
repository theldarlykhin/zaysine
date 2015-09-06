class AddPurchaseitemToOrder < ActiveRecord::Migration
  def change
  	    add_column :orders, :purchase_item, :text, :array => true
  end
end
