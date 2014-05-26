class ContentsOrAnnoncment < ActiveRecord::Base
  belongs_to :contents_or_annoncments, :polymorphic => true
  CONTENT_OR_ANNONCMENT = {"Annoncment" => 0, "Content" => 1, "Image galery" => 2}
end
