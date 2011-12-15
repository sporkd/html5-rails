module Html5
  module Generators
    module GeneratorHelpers

      def application_name
        if defined?(::Rails) && ::Rails.application
          ::Rails.application.class.name.split('::').first
        else
          "application"
        end
      end

      def application_title
        if defined?(::Rails) && ::Rails.application
          ::Rails.application.class.name.split('::').first.titleize
        else
          "My App"
        end
      end

    protected

      def format
        :html
      end

      def handler
        # Rails.configuration.generators.rails[:template_engine] ||
        options[:template_engine] || :erb
      end

      def filename_with_extensions(name)
        [name, format, handler].compact.join(".")
      end
    end
  end
end
