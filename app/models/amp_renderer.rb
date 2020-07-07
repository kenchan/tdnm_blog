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
      when %r{<script[^>]+class="speakerdeck-embed".+data-id="([a-zA-Z0-9]+)"}
        out(%(<amp-iframe width="600" height="450" title="speakerdeck" layout="responsive" sandbox="allow-scripts allow-same-origin allow-popups"  src="https://speakerdeck.com/player/#{$1}?"></amp-iframe>))
      else
        super(node)
      end
    end
  end

  def image(node)
    w, h = 600, 450
    if m = node.url.match(/=w(\d+)-h(\d+)/)
      w, h = m[1], m[2]
    end
    out('<amp-img width="', w, '" height="', h, '" layout="responsive" src="', escape_href(node.url), '"')
    plain do
      out(' alt="', :children, '"')
    end
    out(' />')
  end
end
