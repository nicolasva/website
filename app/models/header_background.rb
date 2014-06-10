class HeaderBackground < ActiveRecord::Base
  validates_presence_of :title
  #validates_presence_of :activation
  before_save :generate_uuid
  has_one :background, as: :backgroundstyles, dependent: :destroy 
  before_save :set_activation_by_default? 
  before_update :set_activation_by_default?
  accepts_nested_attributes_for :background,
                                :allow_destroy => true,
                                :reject_if => lambda {
                                  |a| a['background_image'].blank?
                                }

  def update_with_set_background_image

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
