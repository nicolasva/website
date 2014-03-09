class CreateMenuBackgrounds < ActiveRecord::Migration
  def change
    create_table :menu_backgrounds do |t|

      t.timestamps
    end
  end
end
