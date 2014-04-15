class Background < ActiveRecord::Base
  attr_accessor :delete_background_image
  belongs_to :backgroundstyles, :polymorphic => true
  before_save :delete_image?
  mount_uploader :background_image, BackgroundImageUploader
  ARRAY_ALIGN = {"center" => 0, "right-bottom" => 3, "right-top" => 4, "right-center" => 5, "left-top" => 6, "left-center" => 7, "left-bottom" => 8, "center-top" => 9, "center-bottom" => 10, "stretch" => 11}
  ARRAY_ALIGN_CSS = {"center center" => 0, "right bottom" => 3, "right top" => 4, "right center" => 5, "left top" => 6, "left center" => 7, "left bottom" => 8, "center top" => 9, "center bottom" => 10, "stretch" => 11}

  def delete_image?
    drop_image!  if self.delete_background_image.to_i == 0
  end

  private
  def drop_image!
    self.background_image = ""
    self.background_image_cache = ""
  end
end
