require "test_helper"
require "generators/html5/layout/layout_generator"

class LayoutGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelper
  tests Html5::Generators::LayoutGenerator

  test "with no argument" do
    run_generator 
    assert_file "app/views/layouts/application.html.erb"
  end

  test "with layout named application" do
    run_generator %w(application)
    assert_file "app/views/layouts/application.html.erb"
  end

  test "with flag --template-engine=haml" do
    run_generator ["--template-engine=haml"]
    assert_no_file "app/views/layouts/application.html.erb"
    assert_file "app/views/layouts/application.html.haml"
  end

  test "with layout named pancakes" do
    run_generator %w(pancakes)
    assert_file "app/views/layouts/pancakes.html.erb"
  end

  test "with layout named admin/pancakes" do
    run_generator %w(admin/pancakes)
    assert_file "app/views/layouts/admin/pancakes.html.erb"
  end

  test "with layout named Admin::Pancakes" do
    run_generator %w(Admin::Pancakes)
    assert_file "app/views/layouts/admin/pancakes.html.erb"
  end

  test "without --all-partials flag" do
    run_generator
    assert_no_directory "app/views/application"
  end

  test "with --all-partials flag" do
    run_generator ["--all-partials"]

    assert_file "app/views/layouts/application.html.erb"
    %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
      assert_file "app/views/application/#{ file }.html.erb"
    end
  end

  test "with layout named pancakes and --all-partials flag" do
    run_generator ["pancakes", "--all-partials"]

    assert_file "app/views/layouts/pancakes.html.erb"
    %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
      assert_file "app/views/pancakes/#{ file }.html.erb"
    end
  end

  test "with layout named admin/pancakes all --all-partials flag" do
    run_generator ["admin/pancakes", "--all-partials"]

    assert_file "app/views/layouts/admin/pancakes.html.erb"
    %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
      assert_file "app/views/admin/pancakes/#{ file }.html.erb"
    end
  end
end