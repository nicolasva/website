class Robot::Key < Robot
  validates_presence_of :name
  validates_presence_of :lang
  validates_presence_of :content
  before_save :generate_uuid
  self.table_name = 'robot_keys'
  LANG = {"fr" => 0, "en" => 1}

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end
end
