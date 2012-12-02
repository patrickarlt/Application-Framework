class Application < Sinatra::Base
  helpers do

    def add_js(*javascripts)
      @_scripts ||= []
      @_scripts += javascripts
    end

    def add_css *stylesheets
      @_css ||= []
      @_css += stylesheets
    end

    def include_js
      extra_javascript = ""
      unless @_scripts.to_a.empty?
        @_scripts.each do |script|
          if script.match(/^http(|s):\/\//)
            extra_javascript += "<script src='#{javascript}'></script>"
          elsif script.match(/<script/)
            extra_javascript += "<script>#{javascript}</script>"
          else
            extra_javascript += "<script src='#{javascript_path script}'></script>"
          end
        end
      end
      extra_javascript
    end

    def include_css
      extra_stylesheets = ""
      unless @_css.to_a.empty?
        @_css.each do |stylesheet|
          if stylesheet.match(/^http(|s):\/\//)
            extra_stylesheets += "<link rel='stylesheet' href='#{stylesheet}'>"
          elsif stylesheet.match(/<script/)
            extra_stylesheets += "<style>#{stylesheet}</style>"
          else
            extra_stylesheets += "<link rel='stylesheet' href='#{stylesheet_path stylesheet}'>"
          end
        end

      end
      extra_stylesheets
    end

  end
end