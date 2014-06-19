class TitleWebsite < ActiveRecord::Migration
  def change
    create_table :title_websites, force: true do |t|
      t.string :title
      t.boolean :activation, :default => false, :null => false
      t.timestamps
    end
  end
end
