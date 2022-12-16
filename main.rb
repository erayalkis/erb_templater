require "./lib/UserConfig.rb"

def main
  config = UserConfig.new
  config.load_data

  p config.get_binding
end

main()