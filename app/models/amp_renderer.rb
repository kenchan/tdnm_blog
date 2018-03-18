class AmpRenderer < CommonMarker::HtmlRenderer
  def html(node)
    block do
      if node.string_content =~ %r[https://www.instagram.com/p/([a-zA-Z0-9]+)/]
        out(%(<amp-instagram data-shortcode="#{$1}" data-captioned width="400" height="400" layout="responsive"></amp-instagram>))
      else
        super(node)
      end
    end
  end
end
