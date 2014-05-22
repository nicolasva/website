class Annoncment < ActiveRecord::Base
  attr_accessor :delete_background_image, :photos_attributes, :photos_master, :date_at_html, :date_to_html
  before_save :format_date_at_date_to
  before_update :format_date_at_date_to
  after_save :save_with_image_master
  belongs_to :category
  belongs_to :submenu
  has_one :background, as: :backgroundstyles, dependent: :destroy
  has_many :photos
  accepts_nested_attributes_for :background
  ARRAY_FONT_WEIGHT_TITLE = {"normal" => 0, "lighter" => 1, "bold" => 2, "bolder" => 3}
  ARRAY_TEXT_DECORATION_TITLE = {"none" => 0, "underline" => 1, "overline" => 2, "line-through" => 3, "blink" => 4}

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

  def category_load
    self.submenu.nil? ? self.category : self.submenu.category
  end

  def format_date_at_date_to
    date_at = self.date_at_html.split("/")
    date_to = self.date_to_html.split("/")

    Rails.logger.info date_to 
    Rails.logger.info "#{date_at.last}-#{date_at.first}-#{date_at[date_at.length-2]} 00:00:00"
    self.date_at = "#{date_at.last}-#{date_at[date_at.length-2]}-#{date_at.first} 00:00:00"
    self.date_to = "#{date_to.last}-#{date_to[date_to.length-2]}-#{date_to.first} 00:00:00"
  end

  def update_with_background_image(annoncment_params)
    #update_with_background_background_image(annoncment_params)
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
