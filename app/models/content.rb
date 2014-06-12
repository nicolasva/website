class Content < ActiveRecord::Base
  attr_accessor :delete_background_image
  before_save :generate_uuid
  validates_presence_of :description
  validates_presence_of :english_description
  belongs_to :category
  belongs_to :submenu
  has_one :background, as: :backgroundstyles, dependent: :destroy
  accepts_nested_attributes_for :background,
                                :allow_destroy => true,
                                :reject_if => lambda {
                                  |a| a['background_image'].blank?
                                }
  scope :position, ->(index, id) { update_all(['position=?', index], ['id=?', id]) }

  def update_with_image(content_params)
    update_content = self.update(content_params)
    if update_content
      background = Background.where(backgroundstyles_id: self.id, backgroundstyles_type: "Content").first
      return background.update(content_params["background_attributes"])
    else
      return update_content
    end
  end

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end
end
