require "generators/html5/generator_helpers"

module Html5
  module Generators
    class PartialGenerator < ::Rails::Generators::NamedBase
      include Html5::Generators::GeneratorHelpers

      source_root File.expand_path('../templates', __FILE__)

      argument :name, :type => :string,
                      :required => false,
                      :default => ''

      class_option :all, :type => :boolean,
                         :default => false,
                         :desc => 'Generate all partials'

      class_option :minimal, :type => :boolean,
                             :default => false,
                             :desc => 'Generate minimal partials (_head, _header, _footer)'

       class_option :path, :type => :string,
                           :default => nil,
                           :required => false,
                           :desc => 'resource path to generate partials in'

      class_option :template_engine

      # def validate_name
      #   if options[:all] || options[:minimal]
      #     if partials.include?(file_name)
      #       path = class_path.join('/')
      #       message = "Argument '#{ file_path }' not allowed with --all or --minimal options."
      #       message << " Try using '#{ path }' instead." if !path.blank?
      #       raise Error, message
      #     end
      #   end
      # end

      def generate_partials
        if partials.any?
          empty_directory File.join('app/views', partial_path)
        end
        partials.each do |partial|
          generate_partial(partial)
        end
      end

    protected

      def partials
        if options[:all]
          %w(_flashes _footer _head _header _javascripts _stylesheets _chromeframe)
        elsif options.minimal?
          %w(_footer _head _header _chromeframe)
        elsif file_name
          [file_name]
        else
          []
        end
      end

      def partial_path
        if !options.path.blank?
          path = options.path
        else
          path = File.join(class_path)
        end
        path.blank? ? 'application' : path
      end

      def generate_partial(partial_name)
        template filename_with_extensions(partial_name), File.join('app/views', partial_path, filename_with_extensions(partial_name))
      end
    end
  end
end
