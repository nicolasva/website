class Publication < ActiveRecord::Base
  belongs_to :publicationstyles, :polymorphic => true
end
