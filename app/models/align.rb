class Align < ActiveRecord::Base
  validates_presence_of :align
  ARRAY_ALIGN = {"top" => 0, "left" => 1, "right" => 2}
  belongs_to :aligns, :polymorphic => true

  def self.get_array_align
    return ARRAY_ALIGN
  end
end
