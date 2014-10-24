class MenuBackground < ActiveRecord::Base
  validates_presence_of :title
  before_save :generate_uuid
  has_one :font, as: :fontstyles, dependent: :destroy
  has_one :background, as: :backgroundstyles, dependent: :destroy 
  has_one :align, as: :aligns, dependent: :destroy
  has_one :click_link, as: :click_linkstyles, dependent: :destroy
  before_save :set_activation_by_default?
  before_update :set_activation_by_default?
  accepts_nested_attributes_for :background,
                                :allow_destroy => true
  accepts_nested_attributes_for :click_link,
                                :allow_destroy => true
  
  accepts_nested_attributes_for :align,
                                :allow_destroy => true

  accepts_nested_attributes_for :font,
                                :allow_destroy => true

  def self.activation!(activation)
    hash_activation = Hash.new
    menu_background_id = activation.first
    hash_activation[:activation] = true
    menu_background = MenuBackground.find(menu_background_id)
    return menu_background.activation == false ? menu_background.update(hash_activation) : menu_background
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
