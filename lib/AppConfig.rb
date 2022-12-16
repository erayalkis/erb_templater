require 'yaml'

class AppConfig
  attr_reader :files
  def initialize
    @@data_path = "./config/config.yaml"
    load_variables
    select_files
  end

  private

  def load_variables
    data = YAML.load_file(@@data_path)
    data.each { |key, val| instance_variable_set("@#{key}", val) }
  end

  def select_files
    return @files = @generation.use_only if @generation.use_only.length > 0

    usable_files =  Dir.entries("./templates")
    .select { |file| File.file? File.join("./templates", file) }
    .select { |file| file.include?(".erb") }
    .map { |file| file.split(".")[0] }
    @files = usable_files
    usable_files
  end
end