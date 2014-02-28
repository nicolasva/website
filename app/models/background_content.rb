class BackgroundContent < ActiveRecord::Base
  has_one :background, as: :backgroundstyles, dependent: :destroy
  belongs_to :content
end
