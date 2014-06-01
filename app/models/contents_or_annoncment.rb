class ContentsOrAnnoncment < ActiveRecord::Base
  validates_presence_of :content_or_annoncment
  belongs_to :contents_or_annoncments, :polymorphic => true
  CONTENT_OR_ANNONCMENT = {I18n.t("activerecord.attributes.contents_or_annoncment.content_or_annoncment_choice_annoncment") => 0, I18n.t("activerecord.attributes.contents_or_annoncment.content_or_annoncment_choice_content") => 1, I18n.t("activerecord.attributes.contents_or_annoncment.content_or_annoncment_choice_galery_image") => 2}
end
