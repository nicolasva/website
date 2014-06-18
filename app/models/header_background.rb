class HeaderBackground < ActiveRecord::Base 
  attr_accessor :delete_background_image
  validates_presence_of :title
  #validates_presence_of :activation
  before_save :generate_uuid
  has_one :background, as: :backgroundstyles, dependent: :destroy 
  before_save :set_activation_by_default? 
  before_update :set_activation_by_default?
  accepts_nested_attributes_for :background,
                                :allow_destroy => true

  def update_with_image(header_background_params)
    ##update_header_background = self.update(header_background_params)
    background = Background.where(backgroundstyles_id: self.id, backgroundstyles_type: "HeaderBackground").first
    if background
      return background.update(header_background_params["background_attributes"])
    else
      background = Background.new(header_background_params["background_attributes"])
      return background.save
    end
  end



  def self.activation!(activation)
    hash_activation = Hash.new
    header_background_id = activation.first
    hash_activation[:activation] = true
    header_background = HeaderBackground.find(header_background_id)
    return header_background.activation == false ? header_background.update(hash_activation) : header_background
  end

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end

  private
  def set_activation_by_default?
    if self.id
      header_background = HeaderBackground.find(self.id)
      set_activation_by_default if self.activation == true && header_background.activation == false
    else
      set_activation_by_default
    end
  end

  def set_activation_by_default
    HeaderBackground.update_all(:activation => false)
  end
end
