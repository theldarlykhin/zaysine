class CreateStandardformats < ActiveRecord::Migration
  def change
    create_table :standardformats do |t|
      t.string :timezone
      t.string :currency
      t.string :unitsystemstring
      t.string :defaultweightunit
      t.string :prefix
      t.string :suffix

      t.timestamps
    end
  end
end
