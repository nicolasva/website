class Submenu < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :title
end
