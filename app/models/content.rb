class Content < ActiveRecord::Base
  attr_accessor :delete_background_image
  before_save :generate_uuid
  validates_presence_of :description
  belongs_to :category
  belongs_to :submenu
  has_one :background, as: :backgroundstyles, dependent: :destroy
  accepts_nested_attributes_for :background
 
  scope :position, ->(index, id) { update_all(['position=?', index], ['id=?', id]) }

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end
end
