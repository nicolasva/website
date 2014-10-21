class UpdateColumnPostalCodeForLocalisationShops < ActiveRecord::Migration
  def change
    change_column :localisation_shops, :postal_code, :string, null: false
  end
end
