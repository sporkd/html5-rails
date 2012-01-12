require "test_helper"
require "generators/html5/partial/partial_generator"

class PartialGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelper
  tests Html5::Generators::PartialGenerator

  %w(erb haml).each do |engine|
    defaults = ["--template-engine=#{ engine }"] 

    test "html5:partial --template-engine=#{ engine }" do
      run_generator defaults
      assert_no_directory "app/views/application"
    end

    test "html5:partial _header --template-engine=#{ engine }" do
      run_generator %w(_header) + defaults
      assert_file "app/views/application/_header.html.#{ engine }"
    end

    test "html:partial waffles/_footer --template-engine=#{ engine }" do
      run_generator %w(waffles/_footer) + defaults
      assert_file "app/views/waffles/_footer.html.#{ engine }"
    end

    test "html5:partial --minimal --template-engine=#{ engine }" do
      run_generator %w(--minimal) + defaults

      %w(_footer _head _header).each do |file|
        assert_file "app/views/application/#{ file }.html.#{ engine }"
      end
      %w(_flashes _javascripts _stylesheets).each do |file|
        assert_no_file "app/views/application/#{ file }.html.#{ engine }"
      end
    end

    test "html5:partial --all --template-engine=#{ engine }" do
      run_generator %w(--all) + defaults

      %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
        assert_file "app/views/application/#{ file }.html.#{ engine }"
      end
    end

    test "html5:partial --minimal --path=waffles --template-engine=#{ engine }" do
      run_generator ["--minimal", "--path=waffles"] + defaults

      %w(_footer _head _header).each do |file|
        assert_file "app/views/waffles/#{ file }.html.#{ engine }"
      end
      %w(_flashes _javascripts _stylesheets).each do |file|
        assert_no_file "app/views/waffles/#{ file }.html.#{ engine }"
      end
    end

    test "html5:partial --all --path=admin/waffles --template-engine=#{ engine }" do
      run_generator ["--all", "--path=admin/waffles"] + defaults

      %w(_flashes _footer _head _header _javascripts _stylesheets).each do |file|
        assert_file "app/views/admin/waffles/#{ file }.html.#{ engine }"
      end
    end

    test "header should contain app title in #{ engine } template" do
      run_generator %w(_header) + defaults
      assert_file "app/views/application/_header.html.#{ engine }", /h1(>| )Dummy/
    end

    test "footer should contain app title in #{ engine } template" do
      run_generator %w(_footer) + defaults
      assert_file "app/views/application/_footer.html.#{ engine }", /Dummy, Copyright/
    end
  end

end