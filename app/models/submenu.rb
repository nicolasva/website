class Submenu < ActiveRecord::Base
  belongs_to :category
  has_many :annoncments
  has_many :contents
  has_one :contents_or_annoncment, as: :contents_or_annoncments, dependent: :destroy
  validates_presence_of :title
end
