class Content < ActiveRecord::Base
  attr_accessor :delete_background_image
  before_save :generate_uuid
  validates_presence_of :description
  belongs_to :category
  belongs_to :submenu
  has_one :background, as: :backgroundstyles, dependent: :destroy
  accepts_nested_attributes_for :background

  mount_uploader :background_image, BackgroundImageUploader
 
  scope :position, ->(index, id) { update_all(['position=?', index], ['id=?', id]) }

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end

  def update_with_background_image(content_params)
    if content_params["delete_background_image"] = "0"
      content_params["background_image"] = ""
      content_params["background_image_cache"] = ""
    end
    self.update(content_params)
  end
end
