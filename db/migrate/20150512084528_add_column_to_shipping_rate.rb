class AddColumnToShippingRate < ActiveRecord::Migration
  def change
    add_column :shipping_rates, :amount, :string  
    remove_column :shipping_rates, :paid_all_by_customer
    remove_column :shipping_rates, :paid_all_by_merchant
    remove_column :shipping_rates, :paid_by_merchant_if_purchase_amount_is

    add_column :shipping_rates, :paid_method, :string
    add_column :shipping_rates, :store_id, :string
    add_column :shipping_rates, :convenience_fee, :string  
  end
  
end
