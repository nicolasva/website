class PersonalizeBackground < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :font_color
  validates_presence_of :margin_top
  before_save :generate_uuid
  has_one :background, as: :backgroundstyles, dependent: :destroy
  has_one :height_screen, as: :height_screenstyles, dependent: :destroy
  before_save :set_activation_by_default?
  before_update :set_activation_by_default?
  accepts_nested_attributes_for :background,
                                :allow_destroy => true

  accepts_nested_attributes_for :height_screen,
                                :allow_destroy => true

  def update_with_image(personalize_background_params)
    background = Background.where(backgroundstyles_id: self.id, backgroundstyles_type: "PersonalizeBackground").first
    if background
      return background.update(personalize_background_params["background_attributes"])
    else
      background = Background.new(personalize_background_params["background_attributes"])
      return background.save
    end
  end

  def self.activation!(activation)
    hash_activation = Hash.new
    personalize_background_id = activation.id
    hash_activation[:activation] = true
    personalize_background = PersonalizeBackground.find(personalize_background_id)
    return personalize_background.activation == false ? personalize_background.update(hash_activation) : personalize_background
  end

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end

  private
  def set_activation_by_default?
    if self.id
      personalize_background = PersonalizeBackground.find(self.id)
      set_activation_by_default if self.activation == true && personalize_background.activation == false
    else
      set_activation_by_default
    end
  end

  def set_activation_by_default
    PersonalizeBackground.update_all(:activation => false)
  end
end
