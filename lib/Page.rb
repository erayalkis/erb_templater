require 'erb'

class Page

  attr_reader :templates

  def initialize(file_name)
    @@file_name = file_name
    @@exts = [".text.erb", ".html.erb", ".rhtml"]
    @@path_without_ext = "./templates/#{@@file_name}"
    confirm_file_exists
    get_file_paths
    @templates = load_files
  end

  def load_files
    templates = []
    @@paths.each do |path| 
      file = File.read(File.expand_path(path))
      template = ERB.new(file)
      templates << { path: path, template: template }
    end

    templates
  end

  def generate_files(config_binding)
    raise "Templates not loaded" if @templates.length == 0
    @templates.each do |template_obj|
      output_path = template_obj[:path].gsub('templates', 'out').gsub('.erb', '')
      result = template_obj[:template].result(config_binding)
      File.open(output_path, 'w+') do |f|
        f.write result
      end
    end
  end

  private

  def get_full_paths
    return @@exts.map { |ext| @@path_without_ext + ext }
  end

  def confirm_file_exists
    paths = get_full_paths

    filename_has_match = paths.any? { |path| File.exist?(path) }
    raise "File does not exists" unless filename_has_match
  end

  def get_file_paths
    paths = get_full_paths
    matches = paths.filter { |path| File.exist?(path) }
    raise "No files found" unless matches.length > 0

    @@paths = matches
    return matches
  end

end