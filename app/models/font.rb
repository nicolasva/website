class Font < ActiveRecord::Base
  belongs_to :fontstyles, polymorphic: true

  ARRAY_FONT_FAMILY = {"" => 0, "Arial" => 1, "Comic Sans MS" => 2, "Courier New" => 3, "Georgia" => 4, "Lucida Sans Unicode" => 5, "Tahoma" => 6, "Times New Roman" => 7, "Trebuchet MS" => 8, "Verdana" => 9}
end
