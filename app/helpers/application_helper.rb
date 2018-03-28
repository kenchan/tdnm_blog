module ApplicationHelper
  def weblog
    @_weblog ||= Weblog.first
  end

  def meta_description
    @_meta_description ||= if @article
      truncate(
        strip_tags(CommonMarker.render_html(@article.body)),
        length: MetaTags.config.description_limit
      )
    else
      nil
    end
  end

  def default_meta_tags
    {
      site: weblog.title,
      charset: 'utf-8',
      title: @article.try(:title),
      reverse: true,
      description: meta_description,
      og: {
        image: weblog.default_eye_catching_image_url,
        type: @article ? 'article' : 'website'
      }
    }
  end
end
