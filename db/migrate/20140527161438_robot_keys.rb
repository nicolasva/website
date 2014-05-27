class RobotKeys < ActiveRecord::Migration
  def change
    create_table :robot_keys do |t|
      t.string :uuid, :null => false
      t.string :name, :null => false
      t.integer :lang, :null => false
      t.text :content, :null => false
    end
  end
end
