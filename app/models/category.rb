class Category < ActiveRecord::Base
  validates_presence_of :title
  has_many :contents, dependent: :destroy
  has_many :annoncments, dependent: :destroy
  has_many :submenus, dependent: :destroy
  has_one :contents_or_annoncment, as: :contents_or_annoncments, dependent: :destroy
  has_one :homepage_submenu, as: :homepage_submenus, dependent: :destroy

  scope :position, ->(index, id) { update_all(['position=?', index], ['id=?', id]) }

  def self.set_homepage_and_content(category_params)
    hash_content_or_annoncment = Hash.new
    Category.update_all(:homepage => false)
    category = Category.find(category_params["homepage"].first)
    category.update(:homepage => true)
    category_params[:content_or_annoncment].each do |key, value|
      #exemple
        #people = { 1 => { "first_name" => "David" }, 2 => { "first_name" => "Jeremy" } }
      #actual value
        #{"homepage"=>["1"], "content_or_annoncment"=>{"1"=>"true", "4"=>"true", "5"=>"true", "6"=>"true"}} 
      hash_value = Hash.new
      hash_value["content_or_annoncment"] = value
      hash_content_or_annoncment[key] = hash_value
    end
    category_keys = hash_content_or_annoncment.keys
    category_values = hash_content_or_annoncment.values
    Category.update(category_keys, category_values)
  end
end
