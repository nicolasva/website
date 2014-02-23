class AddColumnNoRepeatBackgroundImageInContents < ActiveRecord::Migration
  def change
   add_column :contents, :no_repeat, :boolean, null: false, default: false
  end
end
