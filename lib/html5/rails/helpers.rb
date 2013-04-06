module Html5
  module Rails
    module Helpers

      # Helper to display conditional html tags for IE
      # http://paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither
      def html_tag(attrs={})
        attrs.symbolize_keys!
        html = ""
        html << "<!--[if lt IE 7]> #{ tag(:html, add_class('lt-ie9 lt-ie8 lt-ie7', attrs), true) } <![endif]-->\n"
        html << "<!--[if IE 7]>    #{ tag(:html, add_class('lt-ie9 lt-ie8', attrs), true) } <![endif]-->\n"
        html << "<!--[if IE 8]>    #{ tag(:html, add_class('lt-ie9', attrs), true) } <![endif]-->\n"
        html << "<!--[if gt IE 8]><!--> "

        if block_given? && defined? Haml
          haml_concat(html.html_safe)
          haml_tag :html, attrs do
            haml_concat("<!--<![endif]-->".html_safe)
            yield
          end
        else
          html = html.html_safe
          html << tag(:html, attrs, true)
          html << " <!--<![endif]-->\n".html_safe
          html
        end
      end

      def ie_html(attrs={}, &block)
        warn "[DEPRECATION] 'ie_html' is deprecated. Use html_tag instead."
        html_tag(attrs, &block)
      end

      def google_account_id
        ENV['GOOGLE_ACCOUNT_ID'] || html5_rails_config(:google_account_id)
      end

      def google_api_key
        ENV['GOOGLE_API_KEY'] || html5_rails_config(:google_api_key)
      end

    private

      def add_class(name, attrs)
        classes = attrs[:class] || ""
        classes.strip!
        classes = " " + classes if !classes.blank?
        classes = name + classes
        attrs.merge(:class => classes)
      end

      def html5_rails_config(key)
        configs = YAML.load_file(File.join(::Rails.root, 'config', 'html5_rails.yml'))[::Rails.env.to_sym] rescue {}
        configs[key]
      end

    end
  end
end
