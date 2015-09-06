class AddApprovedToMerchant < ActiveRecord::Migration
 def self.up
    add_column :merchants, :approved, :string, :default => false, :null => false
    add_index  :merchants, :approved
  end

  def self.down
    remove_index  :merchants, :approved
    remove_column :merchants, :approved
  end
end
