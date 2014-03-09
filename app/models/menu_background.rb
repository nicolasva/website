class MenuBackground < ActiveRecord::Base
  before_save :generate_uuid
  has_one :background, as: :backgroundstyles, dependent: :destroy 
  before_save :set_activation_by_default?
  accepts_nested_attributes_for :background

  def self.activation!(activation)
    hash_activation = Hash.new
    menu_background_id = activation.first
    hash_activation[:activation] = true
    menu_background = MenuBackground.find(menu_background_id)
    return menu_background.update(hash_activation)
  end

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end

  private
  def set_activation_by_default?
    set_activation_by_default if self.activation == true 
  end

  def set_activation_by_default
    MenuBackground.update_all(:activation => false)
  end
end
