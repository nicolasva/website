class Background < ActiveRecord::Base
  attr_accessor :delete_background_image
  belongs_to :backgroundstyles, :polymorphic => true
  mount_uploader :background_image, BackgroundImageUploader
end
