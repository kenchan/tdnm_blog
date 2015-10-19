module Rack
  class HatenaStar
    def initialize(app, options)
      @app, @options = app, options
    end

    def call(env)
      status, headers, response = @app.call(env)

      if success?(status) && html?(headers)
        body = response.body.sub('</head>', <<-EOS.strip_heredoc)
          <script type="text/javascript" src="http://s.hatena.ne.jp/js/HatenaStar.js"></script>
          <script type="text/javascript">
            Hatena.Star.Token = '#{@options[:token]}';
            Hatena.Star.SiteConfig = {
              entryNodes: #{@options[:entry_nodes].to_json}
            };
          </script>
          </head>
        EOS

        [status, headers, [body]]
      else
        [status, headers, response]
      end
    end

    private

    def success?(status)
      status == 200
    end

    def html?(headers)
      headers['Content-Type'] =~ /text\/html/
    end
  end
end
