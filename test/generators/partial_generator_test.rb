require "test_helper"
require "generators/html5/partial/partial_generator"

class PartialGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelper
  tests Html5::Generators::PartialGenerator

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

    %w(_footer _head _header).each do |file|
      assert_file "app/views/application/#{ file }.html.haml"
    end
    %w(_flashes _javascripts _stylesheets).each do |file|
      assert_no_file "app/views/application/#{ file }.html.haml"
    end
  end

  test "with flag --all" do
    run_generator %w(--all)

    %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
      assert_file "app/views/application/#{ file }.html.haml"
    end
  end

  test "with flags --minimal and --path" do
    run_generator ["--minimal", "--path=waffles"]

    %w(_footer _head _header).each do |file|
      assert_file "app/views/waffles/#{ file }.html.haml"
    end
    %w(_flashes _javascripts _stylesheets).each do |file|
      assert_no_file "app/views/waffles/#{ file }.html.haml"
    end
  end

  test "with flags --all and --path" do
    run_generator ["--all", "--path=admin/waffles"]

    %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
      assert_file "app/views/admin/waffles/#{ file }.html.haml"
    end
  end
end