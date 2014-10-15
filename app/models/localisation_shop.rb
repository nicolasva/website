class LocalisationShop < ActiveRecord::Base
  validates_presence_of :address
  validates_presence_of :postal_code
  validates_presence_of :city
end
