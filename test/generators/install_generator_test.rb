require "test_helper"

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Html5::Generators::InstallGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "Assert config file is generated" do
    run_generator
    assert_file "config/compass.rb"
  end
end