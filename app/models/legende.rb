class Legende < ActiveRecord::Base
  belongs_to :legendstyles, polymorphic: true
  validates_presence_of :legende
end
