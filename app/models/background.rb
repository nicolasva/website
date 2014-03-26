class Background < ActiveRecord::Base
  attr_accessor :delete_background_image
  belongs_to :backgroundstyles, :polymorphic => true
  before_save :delete_image?
  mount_uploader :background_image, BackgroundImageUploader
  
  def delete_image?
    drop_image!  if self.delete_background_image.to_i == 0
  end

  private
  def drop_image!
    self.background_image = ""
    self.background_image_cache = ""
  end
end
