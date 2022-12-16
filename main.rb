require "./lib/UserConfig.rb"
require "./lib/AppConfig.rb"
require "./lib/Page.rb"

class Hash
  def method_missing(n)
    self[n.to_s]
  end
end

def main
  config = AppConfig.new
  user_data = UserConfig.new

  config.files.each do |file|
    page = Page.new(file)
    page.generate_files(user_data.get_binding)
  end
end

main()