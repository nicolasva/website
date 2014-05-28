class Robot::Key < Robot
  before_save :generate_uuid
  self.table_name = 'robot_keys'
  LANG = {"fr" => 0, "en" => 1}

  def generate_uuid
    uuid = UUID.new
    self.uuid = uuid.generate
  end
end
