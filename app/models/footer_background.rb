class FooterBackground < ActiveRecord::Base
  validates_presence_of :title
  before_save :generate_uuid
  has_one :background, as: :backgroundstyles, dependent: :destroy
  before_save :set_activation_by_default?
  before_update :set_activation_by_default?
  accepts_nested_attributes_for :background,
                                :allow_destroy => true

  def update_with_image(footer_background_params)
    background = Background.where(backgroundstyles_id: self.id, backgroundstyles_type: "FooterBackground").first
    if background
      return background.update(footer_background_params["background_attributes"])
    else
      background = Background.new(footer_background_params["background_attributes"])
      return background.save
    end
  end

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
