class AmpRenderer < CommonMarker::HtmlRenderer
  def html(node)
    block do
      case node.string_content
      when %r[https://www.instagram.com/p/([a-zA-Z0-9]+)/]
        out(%(<amp-instagram data-shortcode="#{$1}" data-captioned width="400" height="400" layout="responsive"></amp-instagram>))
      when %r[https://twitter.com/kenchan/status/([0-9]+)]
        out(%(<amp-twitter width="375" height="472" layout="responsive" data-tweetid="#{$1}"></amp-twitter>))
      when %r{<iframe.+(//rcm-fe.amazon-adsystem.com[^"']+)+}
        out(%(<amp-iframe width="120" height="240" title="amazon" layout="fixed" sandbox="allow-scripts allow-same-origin allow-popups" src="https:#{$1}">Amazon Associate link</amp-iframe>))
      when %r{<iframe[^>]+https://www.youtube.com/embed/([a-zA-Z0-9]+)}
        out(%(<amp-youtube data-videoid="#{$1}" width="480" height="270" layout="responsive"></amp-youtube>))
      else
        super(node)
      end
    end
  end

  def image(node)
    out('<amp-img height="200" layout="fixed-height" src="', escape_href(node.url), '"')
    plain do
      out(' alt="', :children, '"')
    end
    out(' />')
  end
end
