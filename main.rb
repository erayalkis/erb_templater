require "./lib/UserConfig.rb"
require "./lib/Page.rb"

class Hash
  def method_missing(n)
    self[n.to_s]
  end
end

def main
  config = UserConfig.new

  page = Page.new("0")
  page.generate_files(config.get_binding)
end

main()