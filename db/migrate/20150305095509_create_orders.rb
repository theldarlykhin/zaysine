class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :store_id
      t.string :customer_name
      t.string :customer_phone
      t.string :customer_email
      t.string :customer_city
      t.string :customer_township
      t.string :customer_address

      t.timestamps
    end
  end
end
