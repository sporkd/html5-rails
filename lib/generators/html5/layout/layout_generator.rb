require "generators/html5/generator_helpers"

module Html5
  module Generators
    class LayoutGenerator < ::Rails::Generators::NamedBase
      include Html5::Generators::GeneratorHelpers

      source_root File.expand_path('../../../../../app/views', __FILE__)

      argument :name, :type => :string,
                      :required => false,
                      :default => "application"

      class_option :all_partials, :type => :boolean,
                                  :default => false,
                                  :desc => "Generate all partials for this layout"

      class_option :minimal_partials, :type => :boolean,
                                      :default => false,
                                      :desc => "Generate minimal partials for this layout"

      def generate_layout
        if file_path == "application"
          remove_file "app/views/layouts/application.html.erb"
        end
        file_ext = ".html.haml"
        copy_file "layouts/application#{ file_ext }", File.join("app/views/layouts", class_path, file_name + file_ext)
      end

      def generate_partials
        if options.all_partials?
          invoke "html5:partial", [], { :all => true, :path => file_path }
        end

        if options.minimal_partials?
          invoke "html5:partial", [], { :minimal => true, :path => file_path }
        end
      end

    protected
    end
  end
end
