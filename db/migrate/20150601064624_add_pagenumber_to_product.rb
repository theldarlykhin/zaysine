class AddPagenumberToProduct < ActiveRecord::Migration
 def change
  	  add_column :products, :page, :string  
  end
end
