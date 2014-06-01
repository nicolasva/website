class BackgroundAnnoncment < ActiveRecord::Base
  validates_presence_of :annoncment_id
  has_one :background, as: :backgroundstyles, dependent: :destroy
  belongs_to :annoncment
end
