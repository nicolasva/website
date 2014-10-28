class SubMenuBackground < ActiveRecord::Base
  validates_presence_of :title
  before_save :generate_uuid
  has_one :font, as: :fontstyles, dependent: :destroy
  has_one :background, as: :backgroundstyles, dependent: :destroy 
  has_one :align, as: :aligns, dependent: :destroy
  has_one :click_link, as: :click_linkstyles, dependent: :destroy
  before_save :set_activation_by_default?
  accepts_nested_attributes_for :background,
                                :allow_destroy => true
  accepts_nested_attributes_for :align
  accepts_nested_attributes_for :click_link,
                                :allow_destroy => true

  accepts_nested_attributes_for :font,
                                :allow_destroy => true

  def self.activation!(activation)
    hash_activation = Hash.new
    background_by_default_id = activation.first
    hash_activation[:activation] = true
    sub_menu_background = SubMenuBackground.find(background_by_default_id)
    return sub_menu_background.activation == false ? sub_menu_background.update(hash_activation) : sub_menu_background
  end

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end

  private
  def set_activation_by_default?
    if self.id
      sub_menu_background = SubMenuBackground.find(self.id)
      set_activation_by_default if self.activation == true && sub_menu_background.activation == false
    else
      set_activation_by_default
    end
  end

  def set_activation_by_default
    SubMenuBackground.update_all(:activation => false)
  end
end
