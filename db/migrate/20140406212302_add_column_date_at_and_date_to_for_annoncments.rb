class AddColumnDateAtAndDateToForAnnoncments < ActiveRecord::Migration
  def change
    add_column :annoncments, :date_at, :datetime
    add_column :annoncments, :date_to, :datetime
  end
end
