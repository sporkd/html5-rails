require "test_helper"
require "generators/html5/layout/layout_generator"

class LayoutGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelper
  tests Html5::Generators::LayoutGenerator

  test "with no argument" do
    run_generator
    assert_no_file "app/views/layouts/application.html.erb"
    assert_file "app/views/layouts/application.html.haml"
  end

  test "with layout named application" do
    run_generator %w(application)
    assert_no_file "app/views/layouts/application.html.erb"
    assert_file "app/views/layouts/application.html.haml"
  end

  test "with layout named pancakes" do
    run_generator %w(pancakes)
    assert_file "app/views/layouts/pancakes.html.haml"
  end

  test "with layout named admin/pancakes" do
    run_generator %w(admin/pancakes)
    assert_file "app/views/layouts/admin/pancakes.html.haml"
  end

  test "with layout named Admin::Pancakes" do
    run_generator %w(Admin::Pancakes)
    assert_file "app/views/layouts/admin/pancakes.html.haml"
  end

  test "without --all-partials flag" do
    run_generator
    assert_no_directory "app/views/application"
  end

  test "with --all-partials flag" do
    run_generator ["--all-partials"]

    assert_file "app/views/layouts/application.html.haml"
    %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
      assert_file "app/views/application/#{ file }.html.haml"
    end
  end

  test "with layout named pancakes and --all-partials flag" do
    run_generator ["pancakes", "--all-partials"]

    assert_file "app/views/layouts/pancakes.html.haml"
    %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
      assert_file "app/views/pancakes/#{ file }.html.haml"
    end
  end

  test "with layout named admin/pancakes all --all-partials flag" do
    run_generator ["admin/pancakes", "--all-partials"]

    assert_file "app/views/layouts/admin/pancakes.html.haml"
    %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
      assert_file "app/views/admin/pancakes/#{ file }.html.haml"
    end
  end
end