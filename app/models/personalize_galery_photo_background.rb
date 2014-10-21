class PersonalizeGaleryPhotoBackground < ActiveRecord::Base
  validates_presence_of :title
  before_save :generate_uuid
  has_one :background, as: :backgroundstyles, dependent: :destroy
  before_save :set_activation_by_default?
  before_update :set_activation_by_default?
  accepts_nested_attributes_for :background,
                                :allow_destroy => true

  def self.activation!(activation)
    hash_activation = Hash.new
    personalize_galery_photo_background_id = activation.first
    hash_activation[:activation] = true
    personalize_galery_photo_background = PersonalizeGaleryPhotoBackground.find(personalize_galery_photo_background_id)
    return personalize_galery_photo_background.activation == false ? personalize_galery_photo_background.update(hash_activation) : personalize_galery_photo_background
  end

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end

  private
  def set_activation_by_default?
    if self.id
      personalize_galery_photo_background = PersonalizeGaleryPhotoBackground.find(self.id)
      set_activation_by_default if self.activation == true && personalize_galery_photo_background.activation == false
    else
      set_activation_by_default
    end
  end

  def set_activation_by_default
    PersonalizeGaleryPhotoBackground.update_all(activation: false)
  end
end
