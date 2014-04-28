class FooterBackground < ActiveRecord::Base
  before_save :generate_uuid
  has_one :background, as: :backgroundstyles, dependent: :destroy
  before_save :set_activation_by_default?
  before_update :set_activation_by_default?
  accepts_nested_attributes_for :background

  def self.activation!(activation)
    hash_activation = Hash.new
    footer_background_id = activation.first
    hash_activation[:activation] = true
    footer_background = FooterBackground.find(footer_background_id)
    return footer_background.activation == false ? footer_background.update(hash_activation) : footer_background
  end

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end

  private
  def set_activation_by_default?
    footer_background = FooterBackground.find(self.id)
    set_activation_by_default if self.activation == true && footer_background.activation == false 
  end

  def set_activation_by_default
    FooterBackground.update_all(:activation => false)
  end
end
