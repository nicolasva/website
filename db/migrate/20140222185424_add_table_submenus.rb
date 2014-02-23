class AddTableSubmenus < ActiveRecord::Migration
  def change
    create_table :submenus do |t|
      t.string :title
    end
  end
end
