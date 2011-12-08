module Html5
  module Generators
    module GeneratorHelpers

      def application_name
        if defined?(Rails) && Rails.application
          Rails.application.class.name.split('::').first
        else
          "application"
        end
      end

    end
  end
end
