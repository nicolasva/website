class MenuBackground < ActiveRecord::Base
  validates_presence_of :title
  before_save :generate_uuid
  has_one :background, as: :backgroundstyles, dependent: :destroy 
  has_one :align, as: :aligns, dependent: :destroy
  before_save :set_activation_by_default?
  accepts_nested_attributes_for :background,
                                :allow_destroy => true,
                                :reject_if => lambda {
                                  |a| a['background_image'].blank?
                                }
  accepts_nested_attributes_for :align

  def update_with_image(menu_background_params)
    update_menu_background = self.update(menu_background_params)

    if update_menu_background
      background = Background.where(backgroundstyles_id: self.id, backgroundstyles_type: "MenuBackground").first
      return background.update(menu_background_params["background_attributes"])
    else
      return update_menu_background
    end
  end

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
