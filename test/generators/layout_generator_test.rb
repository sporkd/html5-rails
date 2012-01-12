require "test_helper"
require "generators/html5/layout/layout_generator"

class LayoutGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelper
  tests Html5::Generators::LayoutGenerator

  %w(erb haml).each do |engine|
    defaults = ["--template-engine=#{ engine }"]

    test "html5:layout --template-engine=#{ engine }" do
      run_generator defaults

      assert_no_file "app/views/layouts/application.html.erb" if engine != 'erb'
      assert_file "app/views/layouts/application.html.#{ engine }"
    end

    test "html5:layout application --template-engine=#{ engine }" do
      run_generator %w(application) + defaults
      assert_file "app/views/layouts/application.html.#{ engine }"
    end

    test "html5:layout pancakes --template-engine=#{ engine }" do
      run_generator %w(pancakes) + defaults
      assert_file "app/views/layouts/pancakes.html.#{ engine }"
    end

    test "html5:layout admin/pancakes --template-engine=#{ engine }" do
      run_generator %w(admin/pancakes) + defaults
      assert_file "app/views/layouts/admin/pancakes.html.#{ engine }"
    end

    test "html5:layout Admin::Pancakes --template-engine=#{ engine }" do
      run_generator %w(Admin::Pancakes) + defaults
      assert_file "app/views/layouts/admin/pancakes.html.#{ engine }"
    end

    test "html5:layout --template-engine=#{ engine } (without --all-partials)" do
      run_generator defaults
      assert_no_directory "app/views/application"
    end

    test "html5:layout --all-partials --template-engine=#{ engine }" do
      run_generator ["--all-partials"] + defaults

      assert_file "app/views/layouts/application.html.#{ engine }"
      %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
        assert_file "app/views/application/#{ file }.html.#{ engine }"
      end
    end

    test "html5:layout pancakes --all-partials --template-engine=#{ engine }" do
      run_generator ["pancakes", "--all-partials"] + defaults

      assert_file "app/views/layouts/pancakes.html.#{ engine }"
      %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
        assert_file "app/views/pancakes/#{ file }.html.#{ engine }"
      end
    end

    test "html5:layout admin/pancakes --all-partials --template-engine=#{ engine }" do
      run_generator ["admin/pancakes", "--all-partials"] + defaults

      assert_file "app/views/layouts/admin/pancakes.html.#{ engine }"
      %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
        assert_file "app/views/admin/pancakes/#{ file }.html.#{ engine }"
      end
    end
  end

end