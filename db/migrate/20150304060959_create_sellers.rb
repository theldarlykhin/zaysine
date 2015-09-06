class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :username_string
      t.integer :store_id

      t.timestamps
    end
  end
end
