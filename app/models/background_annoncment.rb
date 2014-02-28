class BackgroundAnnoncment < ActiveRecord::Base
  has_one :background, as: :backgroundstyles, dependent: :destroy
  belongs_to :annoncment
end
