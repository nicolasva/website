class GaleryPhoto < ActiveRecord::Base
  before_save :generate_uuid
  belongs_to :category
  belongs_to :submenu
  mount_uploader :photo_galery, PhotogaleryUploader

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end
end
