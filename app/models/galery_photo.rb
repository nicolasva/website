class GaleryPhoto < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :comment
  validates_presence_of :position
  validates_presence_of :english_title
  before_save :generate_uuid
  belongs_to :category
  belongs_to :submenu
  mount_uploader :photogalery, PhotogaleryUploader

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end
end
