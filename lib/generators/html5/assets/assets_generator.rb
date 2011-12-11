module Html5
  module Generators
    class AssetsGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)

      argument :name, :type => :string,
                      :required => false,
                      :default => "application"

      # def generate_javascripts
      # end

      def generate_stylesheets
        file_ext = ".css.scss"
        copy_file File.join("_defaults" + file_ext), File.join("app/assets/stylesheets/_defaults" + file_ext)
        template File.join("application" + file_ext), File.join("app/assets/stylesheets", stylesheet_name + file_ext)
      end

      def generate_stylesheet_partials
        if stylesheet_partials.any?
          empty_directory File.join("app/assets/stylesheets", stylesheet_name)
        end

        file_ext = ".css.scss"
        stylesheet_partials.each do |partial|
          template File.join("application", partial + file_ext), File.join("app/assets/stylesheets", stylesheet_name, partial + file_ext)
        end
      end

    protected

      def stylesheet_name
        (class_path + [file_name]).join('_')
      end

      def stylesheet_partials
        %w(_defaults document media_queries)
      end
    end
  end
end