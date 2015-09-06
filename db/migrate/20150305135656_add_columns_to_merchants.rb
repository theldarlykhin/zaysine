class AddColumnsToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :provider, :string
    add_column :merchants, :uid, :string
  end
end
