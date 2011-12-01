require "test_helper"

class PartialGeneratorTest < Rails::Generators::TestCase
  tests Html5::Generators::PartialGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "with no arguments" do
    run_generator
    assert_no_directory "app/views/application"
  end

  test "with a partial name" do
    run_generator %w(_header)
    assert_file "app/views/application/_header.html.haml"
  end

  test "with a partial name and path" do
    run_generator %w(waffles/_footer)
    assert_file "app/views/waffles/_footer.html.haml"
  end

  test "with flag --minimal" do
    run_generator %w(--minimal)
    assert_no_file "app/views/application/_flashes.html.haml"
    assert_file    "app/views/application/_footer.html.haml"
    assert_file    "app/views/application/_head.html.haml"
    assert_file    "app/views/application/_header.html.haml"
    assert_no_file "app/views/application/_javascripts.html.haml"
    assert_no_file "app/views/application/_stylesheets.html.haml"
  end

  test "with flag --all" do
    run_generator %w(--all)
    assert_file "app/views/application/_flashes.html.haml"
    assert_file "app/views/application/_footer.html.haml"
    assert_file "app/views/application/_head.html.haml"
    assert_file "app/views/application/_header.html.haml"
    assert_file "app/views/application/_javascripts.html.haml"
    assert_file "app/views/application/_stylesheets.html.haml"
  end

  test "with flags --minimal and --path" do
    run_generator ["--minimal", "--path=waffles"]
    assert_no_file "app/views/waffles/_flashes.html.haml"
    assert_file    "app/views/waffles/_footer.html.haml"
    assert_file    "app/views/waffles/_head.html.haml"
    assert_file    "app/views/waffles/_header.html.haml"
    assert_no_file "app/views/waffles/_javascripts.html.haml"
    assert_no_file "app/views/waffles/_stylesheets.html.haml"
  end

  test "with flags --all and --path" do
    run_generator ["--all", "--path=admin/waffles"]
    assert_file "app/views/admin/waffles/_flashes.html.haml"
    assert_file "app/views/admin/waffles/_footer.html.haml"
    assert_file "app/views/admin/waffles/_head.html.haml"
    assert_file "app/views/admin/waffles/_header.html.haml"
    assert_file "app/views/admin/waffles/_javascripts.html.haml"
    assert_file "app/views/admin/waffles/_stylesheets.html.haml"
  end
end