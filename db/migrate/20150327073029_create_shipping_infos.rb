class CreateShippingInfos < ActiveRecord::Migration
  def change
    create_table :shipping_infos do |t|
      t.string :full_name
      t.string :contact_number
      t.string :email
      t.string :city
      t.string :township
      t.text :shipping_address

      t.timestamps
    end
  end
end
