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

    assert_file "app/assets/stylesheets/application/index.css.scss", /@import 'variables';/
    assert_file "app/assets/stylesheets/application/index.css.scss", /@import 'layout';/
    assert_file "app/assets/stylesheets/application/index.css.scss", /@import 'media_queries';/
    %w(variables layout media_queries).each do |file|
      assert_file "app/assets/stylesheets/application/#{ file }.css.scss"
    end
  end

  test "html5:assets application" do
    run_generator %w(application)

    assert_file "app/assets/stylesheets/application/index.css.scss", /@import 'variables';/
    assert_file "app/assets/stylesheets/application/index.css.scss", /@import 'layout';/
    assert_file "app/assets/stylesheets/application/index.css.scss", /@import 'media_queries';/
    %w(variables layout media_queries).each do |file|
      assert_file "app/assets/stylesheets/application/#{ file }.css.scss"
    end
  end

  test "html5:assets pancakes" do
    run_generator %w(pancakes)

    assert_file "app/assets/stylesheets/pancakes/index.css.scss", /@import 'variables';/
    assert_file "app/assets/stylesheets/pancakes/index.css.scss", /@import 'layout';/
    assert_file "app/assets/stylesheets/pancakes/index.css.scss", /@import 'media_queries';/
    %w(variables layout media_queries).each do |file|
      assert_file "app/assets/stylesheets/pancakes/#{ file }.css.scss"
    end
  end

  test "html5:assets admin/pancakes" do
    run_generator %w(admin/pancakes)

    assert_file "app/assets/stylesheets/admin/pancakes/index.css.scss", /@import 'variables';/
    assert_file "app/assets/stylesheets/admin/pancakes/index.css.scss", /@import 'layout';/
    assert_file "app/assets/stylesheets/admin/pancakes/index.css.scss", /@import 'media_queries';/
    %w(variables layout media_queries).each do |file|
      assert_file "app/assets/stylesheets/admin/pancakes/#{ file }.css.scss"
    end
  end
end
