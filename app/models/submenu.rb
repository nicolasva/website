class Submenu < ActiveRecord::Base
  belongs_to :category
  has_many :annoncments
  has_many :contents
  validates_presence_of :title
end
