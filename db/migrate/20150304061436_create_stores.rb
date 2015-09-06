class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
	  t.string :phone
	  t.string :street
	  t.string :city
	  t.string :postal

      t.timestamps
    end
  end
end
