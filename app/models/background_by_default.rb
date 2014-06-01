class BackgroundByDefault < ActiveRecord::Base
  attr_accessor :activations
  validates_presence_of :title
  validates_presence_of :uuid
  validates_presence_of :activation
  before_save :generate_uuid  
  has_one :background, as: :backgroundstyles, dependent: :destroy
  before_save :set_activation_by_default?
  before_update :set_activation_by_default?
  accepts_nested_attributes_for :background

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
    background_by_default = BackgroundByDefault.find(self.id)
    set_activation_by_default if self.activation == true && background_by_default.activation == false
  end

  def set_activation_by_default
    BackgroundByDefault.update_all(:activation => false)
  end

end
