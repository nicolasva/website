class Background < ActiveRecord::Base
  attr_accessor :delete_background_image
  belongs_to :backgroundstyles, :polymorphic => true
  before_save :delete_image?
  mount_uploader :background_image, BackgroundImageUploader
  
  def delete_image?
    #Rails.logger.info "-=-=-=-=-=-=-=-=-delete_background_image-=-=-=-=-=-=-=-#{self.delete_background_image}-=-=-=-=-=-=-"
    #fvdsvdfvdfvdfvdf
  end
end
