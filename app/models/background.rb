class Background < ActiveRecord::Base
  belongs_to :backgroundstyles, :polymorphic => true
end
