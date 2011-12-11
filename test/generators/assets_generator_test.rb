require "test_helper"
require "generators/html5/assets/assets_generator"

class AssetsGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelper
  tests Html5::Generators::AssetsGenerator

  test "javascripts should be generated" do
    run_generator
    assert_file "app/assets/javascripts/application.js", /\/\/= require h5bp/
    assert_file "app/assets/javascripts/polyfills.js"
  end

  test "with no argument" do
    run_generator

    assert_file "app/assets/stylesheets/_defaults.css.scss"
    assert_file "app/assets/stylesheets/application.css.scss", /@import "application\/document";/
    %w(_defaults document media_queries).each do |file|
      assert_file "app/assets/stylesheets/application/#{ file }.css.scss"
    end
  end

  test "named application" do
    run_generator %w(application)

    assert_file "app/assets/stylesheets/_defaults.css.scss"
    assert_file "app/assets/stylesheets/application.css.scss", /@import "application\/document";/
    %w(_defaults document media_queries).each do |file|
      assert_file "app/assets/stylesheets/application/#{ file }.css.scss"
    end
  end

  test "named pancakes" do
    run_generator %w(pancakes)

    assert_file "app/assets/stylesheets/_defaults.css.scss"
    assert_file "app/assets/stylesheets/pancakes.css.scss", /@import "pancakes\/document";/
    %w(_defaults document media_queries).each do |file|
      assert_file "app/assets/stylesheets/pancakes/#{ file }.css.scss"
    end
  end

  test "named admin/pancakes" do
    run_generator %w(admin/pancakes)

    assert_file "app/assets/stylesheets/_defaults.css.scss"
    assert_file "app/assets/stylesheets/admin_pancakes.css.scss", /@import "admin\/pancakes\/document";/
    %w(_defaults document media_queries).each do |file|
      assert_file "app/assets/stylesheets/admin_pancakes/#{ file }.css.scss"
    end
  end
end