class Photo < ActiveRecord::Base
  attr_accessor :drop_photo
  before_save :generate_uuid
  belongs_to :annoncment

  mount_uploader :photo, PhotoUploader

  scope :position, ->(index, id) { update_all(['position=?', index], ['id=?', id]) }
  
  accepts_nested_attributes_for :annoncment

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end
end

