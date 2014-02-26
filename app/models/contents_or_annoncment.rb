class ContentsOrAnnoncment < ActiveRecord::Base
  belongs_to :contents_or_annoncments, :polymorphic => true
end
