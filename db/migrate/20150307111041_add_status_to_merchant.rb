class AddStatusToMerchant < ActiveRecord::Migration
  def change
  	 add_column :merchants, :status, :string, :null => false, :default => 'unconfirm'
  end
end
