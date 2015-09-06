class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :location
      t.string :total_spent

      t.timestamps
    end
  end
end
