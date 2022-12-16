require 'yaml'

YAML_PATH = "./config/user_config.yaml"

class UserConfig
  def initialize()
    @@data_path = YAML_PATH
    load_data
  end

  def load_data()
    data = YAML.load_file(@@data_path)
    data.each { |key, val| instance_variable_set("@#{key}", val) }
  end

  def get_binding
    binding
  end
end