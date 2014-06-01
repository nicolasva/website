class ContactU < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :email
  validates_presence_of :content
end
