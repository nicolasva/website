class LocalisationShops < ActiveRecord::Migration
  def change
    create_table :localisation_shops do |t|
      t.text :address, null: false
      t.integer :postal_code, null: false
      t.string :city, null: false
    end
  end
end
