class CreateHomepageSubmenus < ActiveRecord::Migration
  def change
    create_table :homepage_submenus do |t|
      t.boolean :homepage, default: false, null: false
      t.integer :homepage_submenus_id
      t.string :homepage_submenus_type
      t.timestamps
    end
  end
end
