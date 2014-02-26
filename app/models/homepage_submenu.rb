class HomepageSubmenu < ActiveRecord::Base
  belongs_to :homepage_submenus, :polymorphic => true
end
