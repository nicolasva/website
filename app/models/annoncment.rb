class Annoncment < ActiveRecord::Base
  attr_accessor :photos_attributes, :photos_master
  after_save :save_with_image_master
  belongs_to :category
  has_one :background, as: :backgroundstyles, dependent: :destroy
  has_many :photos
  accepts_nested_attributes_for :background

  scope :position, ->(index, id) { update_all(['position=?', index], ['id=?', id]) }

  def save_with_image_master
    self.photos_attributes.each do |key, value|
      value["master_image"] = self.photos_master["master_image"].include?(key.to_s)
      photo = self.photos.find_by_uuid(value["uuid"])
      if photo.nil? == true
        photo = self.photos.new(value) 
        photo.save
      else
        photo.update(value)
      end
    end
  end

  def update_with_background_image(annoncment_params)
    annoncment_params["photos_attributes"].each do |key, value|
      if !value["drop_photo"].nil? && value["drop_photo"].to_i
        id = value["id"].to_i
        photo = Photo.find(id)
        photo.destroy
      end
    end
    self.update(annoncment_params)
  end
end
