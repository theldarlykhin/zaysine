class CreateMerchantInfos < ActiveRecord::Migration
  def change
    create_table :merchant_infos do |t|
      t.string :name
      t.string :account_email
      t.string :customer_email
      t.string :storename
      t.string :phone
      t.string :street
      t.string :city
      t.string :postal

      t.timestamps
    end
  end
end
