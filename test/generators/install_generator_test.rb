require "test_helper"

class InstallGeneratorTest < GeneratorTest
  tests Html5::Generators::InstallGenerator

  test "Compass config file should be generated" do
    run_generator
    assert_file "config/compass.rb"
  end

  test "html5_rails.yml config file should be generated" do
    run_generator
    assert_file "config/html5_rails.yml"
  end
  
  test "application layout should be generated" do
    run_generator
    assert_no_file "app/views/layouts/application.html.erb"
    assert_file "app/views/layouts/application.html.haml"
  end
end