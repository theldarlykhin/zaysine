class AddColumToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :userid, :string
    remove_column :merchants, :userid
  end
end
