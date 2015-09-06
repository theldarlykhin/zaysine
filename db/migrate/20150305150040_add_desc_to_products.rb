class AddDescToProducts < ActiveRecord::Migration
  def change
    add_column :products, :desc, :string
    add_column :products, :category_id, :integer
    add_column :products, :brand_id, :integer
    add_column :products, :color_id, :integer
    add_column :products, :store_id, :string
    add_column :products, :inventory, :string
    add_column :products, :price, :integer
    add_column :products, :inventory_policy, :string
    add_column :products, :multiple_option, :string
  end
end

