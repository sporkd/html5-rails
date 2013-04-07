require "test_helper"
require "generators/html5/assets/assets_generator"

class AssetsGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelper
  tests Html5::Generators::AssetsGenerator

  test "html5:assets should make changes to application.js" do
    run_generator

    assert_file "app/assets/javascripts/application.js", /\/\/= require h5bp/ do |contents|
      assert_no_match /require_tree \./, contents
    end
  end

  test "html5:assets should generate polyfills.js" do
    run_generator
    assert_file "app/assets/javascripts/polyfills.js"
  end

  test "html5:assets" do
    run_generator

    assert_file "app/assets/stylesheets/_variables.css.scss"
    assert_file "app/assets/stylesheets/application.css.scss", /@import 'application\/document';/
    assert_file "app/assets/stylesheets/application.css.scss", /@import 'application\/media_queries';/
    %w(document media_queries).each do |file|
      assert_file "app/assets/stylesheets/application/#{ file }.css.scss"
    end
  end

  test "html5:assets application" do
    run_generator %w(application)

    assert_file "app/assets/stylesheets/_variables.css.scss"
    assert_file "app/assets/stylesheets/application.css.scss", /@import 'application\/document';/
    assert_file "app/assets/stylesheets/application.css.scss", /@import 'application\/media_queries';/
    %w(document media_queries).each do |file|
      assert_file "app/assets/stylesheets/application/#{ file }.css.scss"
    end
  end

  test "html5:assets pancakes" do
    run_generator %w(pancakes)

    assert_file "app/assets/stylesheets/_variables.css.scss"
    assert_file "app/assets/stylesheets/pancakes.css.scss", /@import 'pancakes\/document';/
    assert_file "app/assets/stylesheets/pancakes.css.scss", /@import 'pancakes\/media_queries';/
    %w(document media_queries).each do |file|
      assert_file "app/assets/stylesheets/pancakes/#{ file }.css.scss"
    end
  end

  test "html5:assets admin/pancakes" do
    run_generator %w(admin/pancakes)

    assert_file "app/assets/stylesheets/_variables.css.scss"
    assert_file "app/assets/stylesheets/admin_pancakes.css.scss", /@import 'admin\/pancakes\/document';/
    assert_file "app/assets/stylesheets/admin_pancakes.css.scss", /@import 'admin\/pancakes\/media_queries';/
    %w(document media_queries).each do |file|
      assert_file "app/assets/stylesheets/admin_pancakes/#{ file }.css.scss"
    end
  end
end
