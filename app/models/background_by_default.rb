class BackgroundByDefault < ActiveRecord::Base
  before_save :generate_uuid
  has_one :background, as: :backgroundstyles, dependent: :destroy
  before_save :set_activation_by_default
  accepts_nested_attributes_for :background

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end

  def set_activation_by_default
    BackgroundByDefault.update_all(:activation => false)
  end
end
