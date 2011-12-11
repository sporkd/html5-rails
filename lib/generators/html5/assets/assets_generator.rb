module Html5
  module Generators
    class AssetsGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)

      argument :name, :type => :string,
                      :required => false,
                      :default => "application"

      def generate_javascripts
        if file_path == "application"
          inject_into_file "app/assets/javascripts/application.js", :after => "require jquery_ujs" do
            "\n//= require h5bp"
          end
        else
          template File.join("javascripts", "application.js"), File.join("app/assets/javascripts", "#{ asset_name }.js")
        end
        template File.join("javascripts", "polyfills.js"), File.join("app/assets/javascripts", "polyfills.js")
      end

      def generate_stylesheets
        if file_path == "application"
          remove_file "app/assets/stylesheets/application.css"
        end

        file_ext = ".css.scss"
        copy_file File.join("stylesheets", "_defaults" + file_ext), File.join("app/assets/stylesheets/_defaults" + file_ext)
        template File.join("stylesheets", "application" + file_ext), File.join("app/assets/stylesheets", asset_name + file_ext)
      end

      def generate_stylesheet_partials
        if stylesheet_partials.any?
          empty_directory File.join("app/assets/stylesheets", asset_name)
        end

        file_ext = ".css.scss"
        stylesheet_partials.each do |partial|
          template File.join("stylesheets", "application", partial + file_ext), File.join("app/assets/stylesheets", asset_name, partial + file_ext)
        end
      end

      # TODO
      # def add_precompiles
      # end

    protected

      def asset_name
        (class_path + [file_name]).join('_')
      end

      def stylesheet_partials
        %w(_defaults document media_queries)
      end
    end
  end
end