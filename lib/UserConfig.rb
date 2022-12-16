require 'yaml'

class UserConfig
  def initialize
    @@data_path = "./config/user_config.yaml"
    load_data
  end

  def get_binding
    binding
  end

  private
  def load_data
    data = YAML.load_file(@@data_path)
    data.each { |key, val| instance_variable_set("@#{key}", val) }
  end
end