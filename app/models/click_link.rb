class ClickLink < ActiveRecord::Base
  belongs_to :click_linkstyles, :polymorphic => true
end
