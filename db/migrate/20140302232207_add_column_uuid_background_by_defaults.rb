class AddColumnUuidBackgroundByDefaults < ActiveRecord::Migration
  def change
    add_column :background_by_defaults, :uuid, :string
  end
end
