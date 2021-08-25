class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :company, null: false, index: true
      t.string :product, null: false, index: true
      t.string :industry, null: false, index: true
      t.string :name, null: false, index: true
      t.string :hs_code, null: false, index: true
      t.string :country_code, null: false, index: true
      t.string :lot_size, null: false, index: true
      t.numeric :price, null: false, index: true

      t.timestamps
    end
  end
end
