class PersonalizeBackground < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :font_color
  validates_presence_of :margin_top
  before_save :generate_uuid
  has_one :background, as: :backgroundstyles, dependent: :destroy
  before_save :set_activation_by_default?
  before_update :set_activation_by_default?
  accepts_nested_attributes_for :background

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
    personalize_background = PersonalizeBackground.find(self.id)
    set_activation_by_default if self.activation == true && personalize_background.activation == false
  end

  def set_activation_by_default
    PersonalizeBackground.update_all(:activation => false)
  end
end
