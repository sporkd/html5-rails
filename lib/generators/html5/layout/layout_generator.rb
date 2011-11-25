module Html5
  module Generators
    class LayoutGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../../../../../app/views', __FILE__)

      argument :name, :type => :string,
                      :required => false,
                      :default => "application",
                      :desc => "The layout name"

      class_option :partials, :type => :boolean,
                              :default => false,
                              :desc => "Generate partials"

      def generate_layout
        remove_file "app/views/layouts/#{ name.underscore }.html.erb"
        copy_file "layouts/application.html.haml", "app/views/layouts/#{ name.underscore }.html.haml"
      end

      def copy_partials
        puts "OPTIONS #{options.inspect}"
        if options.partials?
          puts "GOT PARTIALS...."
          directory "application", "app/views/#{ name.underscore }"
        end
      end
    end
  end
end
