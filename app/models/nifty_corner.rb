class NiftyCorner < ActiveRecord::Base
  belongs_to :nifty_cornerstyles, :polymorphic => true
end
