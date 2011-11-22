require "test_helper"

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Html5::Generators::InstallGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "Compass config file should be generated" do
    run_generator
    assert_file "config/compass.rb"
  end

  test "html5_rails.yml config file should be generated" do
    run_generator
    assert_file "config/html5_rails.yml"
  end
end