class GaleryPhoto < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :comment
  validates_presence_of :position
  validates_presence_of :english_title
  before_save :generate_uuid
  belongs_to :category
  belongs_to :submenu
  has_one :publication, as: :publicationstyles, dependent: :destroy

  accepts_nested_attributes_for :publication,
                                :allow_destroy => true
  mount_uploader :photogalery, PhotogaleryUploader

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end
end
