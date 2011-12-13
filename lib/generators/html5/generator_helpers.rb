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

    end
  end
end
