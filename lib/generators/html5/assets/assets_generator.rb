require "generators/html5/generator_helpers"

module Html5
  module Generators
    class AssetsGenerator < ::Rails::Generators::NamedBase
      include Html5::Generators::GeneratorHelpers

      source_root File.expand_path('../templates', __FILE__)

      argument :name, :type => :string,
                      :required => false,
                      :default => "application"

      def generate_javascripts
        asset_path = "app/assets/javascripts/#{ asset_name }.js"
        if File.exist?(asset_path) && File.read(asset_path) =~ /require jquery_ujs$/
          inject_into_file asset_path, :after => "require jquery_ujs" do
            "\n//= require h5bp"
          end
          gsub_file asset_path, /^\/\/= require_tree \.(\\n)?/, ""
        else
          template "javascripts/application.js", asset_path
        end
        template "javascripts/polyfills.js", "app/assets/javascripts/polyfills.js"
      end

      def generate_stylesheets
        if file_path == "application"
          remove_file "app/assets/stylesheets/application.css"
        end

        file_ext = ".css.scss"
        copy_file "stylesheets/_variables#{ file_ext }", "app/assets/stylesheets/_variables#{ file_ext }"
        template "stylesheets/application#{ file_ext }", File.join("app/assets/stylesheets", asset_name + file_ext)
      end

      def generate_stylesheet_partials
        if stylesheet_partials.any?
          empty_directory File.join("app/assets/stylesheets", asset_name)
        end

        file_ext = ".css.scss"
        stylesheet_partials.each do |partial|
          template File.join("stylesheets/application", partial + file_ext), File.join("app/assets/stylesheets", asset_name, partial + file_ext)
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
        %w(chromeframe document media_queries)
      end
    end
  end
end
