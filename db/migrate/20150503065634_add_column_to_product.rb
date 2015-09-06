class AddColumnToProduct < ActiveRecord::Migration
  def change  
  	remove_column :products, :color    
    remove_column :products, :color_id    
    remove_column :products, :multiple_option
    add_column :products, :sku, :string
    add_column :products, :option_name, :string, :array => true
    add_column :products, :option_value, :string, :array => true
  end
end
