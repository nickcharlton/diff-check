require "rspec"
require "jet_black"
require "jet_black/rspec"

JetBlack.configure do |config|
  config.path_prefix = File.expand_path("../bin", __dir__)
end
