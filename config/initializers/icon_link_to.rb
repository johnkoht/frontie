# Patches the link_to URL Helper to allow :icon and :position parameters
# for icon links

module ActionView
  module Helpers
    module UrlHelper

      def link_to(name = nil, options = nil, html_options = nil, &block)
        html_options, options, name = options, name, block if block_given?
        options ||= {}

        html_options = convert_options_to_data_attributes(options, html_options)

        url = url_for(options)
        html_options['href'] ||= url

        # If the icon option is passed then let's build the content
        if html_options.present? and html_options['icon'].present?
          icon = content_tag(:i, "", class: html_options['icon'])
          html_options.delete('icon')

          # If a position option and direciton is passed then let's use it or default
          # to the position: :right
          if html_options['position'].present? and html_options['position'] == :right
            html_options.delete('position')
            content = "#{name || url} #{icon} ".html_safe
          else
            content = "#{icon} #{name || url}".html_safe
          end
        else
          content = name || url
        end

        content_tag(:a, content, html_options, &block)
      end

    end
  end
end