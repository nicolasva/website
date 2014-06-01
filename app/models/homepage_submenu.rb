class HomepageSubmenu < ActiveRecord::Base
  validates_presence_of :homepage
  belongs_to :homepage_submenus, :polymorphic => true
end
