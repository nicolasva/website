class HeightScreen < ActiveRecord::Base
  belongs_to :height_screenstyles, polymorphic: true
end
