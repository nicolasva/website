class Content < ActiveRecord::Base
  attr_accessor :delete_background_image
  before_save :generate_uuid
  validates_presence_of :description
  validates_presence_of :english_description
  belongs_to :category
  belongs_to :submenu
  has_one :background, as: :backgroundstyles, dependent: :destroy
  accepts_nested_attributes_for :background,
                                :allow_destroy => true
                                #:reject_if => lambda {
                                #  |a| a['background_image'].blank?
                                #}
  scope :position, ->(index, id) { update_all(['position=?', index], ['id=?', id]) }

  def update_with_image(content_params)
    background = Background.where(backgroundstyles_id: self.id, backgroundstyles_type: "Content").first
    if background
      return background.update(content_params["background_attributes"])
    else
      background = Backgrouund.new(content_params["background_attributes"])
      return background.save
    end
  end

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end
end
