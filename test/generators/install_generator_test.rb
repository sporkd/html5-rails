require "test_helper"
require "generators/html5/install/install_generator"

class InstallGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelper
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
    assert_file "app/views/layouts/application.html.erb"
  end

  test "with flag --template-engine=haml" do
    run_generator ["--template-engine=haml"]
    assert_no_file "app/views/layouts/application.html.erb"
    assert_file "app/views/layouts/application.html.haml"
  end

  test "minimal application partials should be generated" do
    run_generator
    %w(_footer _head _header _chromeframe).each do |file|
      assert_file "app/views/application/#{ file }.html.erb"
    end
    %w(_flashes _javascripts _stylesheets).each do |file|
      assert_no_file "app/views/application/#{ file }.html.erb"
    end
  end

  test "assets should be generated" do
    run_generator

    assert_file "app/assets/stylesheets/_variables.css.scss"
    assert_file "app/assets/stylesheets/application.css.scss", /@import "application\/chromeframe";/
    assert_file "app/assets/stylesheets/application.css.scss", /@import "application\/document";/
    assert_file "app/assets/stylesheets/application.css.scss", /@import "application\/media_queries";/
    %w(chromeframe document media_queries).each do |file|
      assert_file "app/assets/stylesheets/application/#{ file }.css.scss"
    end
  end

  test "application.css gets removed" do
    run_generator
    assert_no_file "app/assets/stylesheets/application.css"
  end
end