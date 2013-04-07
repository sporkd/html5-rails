require "generators/html5/generator_helpers"

module Html5
  module Generators
    class AssetsGenerator < ::Rails::Generators::NamedBase
      include Html5::Generators::GeneratorHelpers

      source_root File.expand_path('../templates', __FILE__)

      argument :name, :type => :string,
                      :required => false,
                      :default => 'application'

      def generate_javascripts
        prefix = File.join('app', 'assets', 'javascripts')
        manifest = File.join(prefix, File.basename(asset_path) + '.js')

        empty_directory File.join(prefix, File.dirname(asset_path))

        if File.exist?(manifest) && File.read(manifest) =~ /require jquery_ujs$/
          inject_into_file manifest, :after => "require jquery_ujs" do
            "\n//= require h5bp"
          end
          gsub_file manifest, /^\/\/= require_tree \.(\\n)?/, ''
        else
          template "javascripts/application.js", manifest
        end

        template "javascripts/polyfills.js", File.join(prefix, 'polyfills.js')
      end

      def generate_stylesheets
        prefix = File.join('app', 'assets', 'stylesheets')

        if file_path == 'application'
          remove_file File.join(prefix, 'application.css')
        end

        if stylesheets.any?
          empty_directory File.join(prefix, asset_path)
        end

        stylesheets.each do |stylesheet|
          file_name = stylesheet + ".css.scss"
          template "stylesheets/application/#{ file_name }", File.join(prefix, asset_path, file_name)
        end
      end

      # TODO
      # def add_precompiles
      # end

    protected

      def asset_path
        File.join(class_path + [file_name])
      end

      def stylesheets
        %w(index variables layout media_queries)
      end
    end
  end
end
