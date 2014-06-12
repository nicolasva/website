class BackgroundByDefault < ActiveRecord::Base
  attr_accessor :activations
  validates_presence_of :title
  before_save :generate_uuid  
  has_one :background, as: :backgroundstyles, dependent: :destroy
  before_save :set_activation_by_default?
  before_update :set_activation_by_default?
  accepts_nested_attributes_for :background,
                                :allow_destroy => true,
                                :reject_if => lambda {
                                  |a| a['background_image'].blank?
                                }

  def update_with_image(background_by_default_params)
    update_background_by_default = self.update(background_by_default_params)
    if update_background_by_default
      background = Background.where(backgroundstyles_id: self.id, backgroundstyles_type: "BackgroundByDefault").first
      return background.update(background_by_default_params["background_attributes"])
    else
      return update_background_by_default
    end
  end

  def self.activation!(activations)
    hash_activation = Hash.new
    background_by_default_id = activations.first
    hash_activation[:activation] = true
    background_by_default = BackgroundByDefault.find(background_by_default_id)
    return background_by_default.activation == false ? background_by_default.update(hash_activation) : background_by_default
  end

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end

  private
  def set_activation_by_default?
    if self.id
      background_by_default = BackgroundByDefault.find(self.id)
      set_activation_by_default if self.activation == true && background_by_default.activation == false
    else
      set_activation_by_default
    end
  end

  def set_activation_by_default
    BackgroundByDefault.update_all(:activation => false)
  end

end
