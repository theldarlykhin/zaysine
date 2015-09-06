class CreateShippingRates < ActiveRecord::Migration
  def change
    create_table :shipping_rates do |t|
      t.string :rate
      t.string :paid_all_by_customer
      t.string :paid_all_by_merchant
      t.string :paid_by_merchant_if_purchase_amount_is

      t.timestamps
    end
  end
end
