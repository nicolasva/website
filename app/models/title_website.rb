class TitleWebsite < ActiveRecord::Base
  validates_presence_of :title
  before_save :set_activation_by_default?
  before_update :set_activation_by_default?

  def self.activation!(activation)
    hash_activation = Hash.new
    title_website_id = activation.first
    hash_activation[:activation] = true
    title_website = TitleWebsite.find(title_website_id)
    return title_website.activation == false ? title_website.update(hash_activation) : title_website
  end

  private
  def set_activation_by_default?
    set_activation_by_default if self.activation == true
  end

  def set_activation_by_default
    TitleWebsite.update_all(:activation => false)
  end
end
