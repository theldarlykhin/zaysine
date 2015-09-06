class AddColumnToShippingrate < ActiveRecord::Migration
  def change
    add_column :shipping_rates, :amount_for_convenience_fee, :string  
    add_column :shipping_rates, :paidmethod_for_convenience_fee, :string  
  end
end
