class AmpRenderer < CommonMarker::HtmlRenderer
  def html(node)
    block do
      case node.string_content
      when %r[https://www.instagram.com/p/([a-zA-Z0-9]+)/]
        out(%(<amp-instagram data-shortcode="#{$1}" data-captioned width="400" height="400" layout="responsive"></amp-instagram>))
      when %r[https://twitter.com/kenchan/status/([0-9]+)]
        out(%(<amp-twitter width="375" height="472" layout="responsive" data-tweetid="#{$1}"></amp-twitter>))
      else
        super(node)
      end
    end
  end
end
