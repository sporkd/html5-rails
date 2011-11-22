require "test_helper"

class LayoutGeneratorTest < Rails::Generators::TestCase
  tests Html5::Generators::LayoutGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "application.html.erb layout should be removed" do
    run_generator
    assert_no_file "app/views/layouts/application.html.erb"
  end

  test "application.html.haml layout should be copied" do
    run_generator
    assert_file "app/views/layouts/application.html.haml"
  end

  test "foo_layout.html.erb layout should be removed" do
    run_generator %w(foo_layout)
    assert_no_file "app/views/layouts/foo_layout.html.erb"
  end

  test "foo_layout.html.haml layout should be copied" do
    run_generator %w(foo_layout)
    assert_file "app/views/layouts/foo_layout.html.haml"
  end

  test "application directory should not be copied" do
    run_generator
    assert_no_directory "app/views/application"
  end

  test "application directory should be copied with partials" do
    run_generator ["application", "--partials=true"]
    assert_directory "app/views/application"
    assert_file "app/views/appliction/_head.html.haml"
  end
end