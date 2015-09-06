class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :store_name

      t.timestamps
    end
  end
end
