module ApplicationHelper
  def weblog
    @_weblog ||= Weblog.first
  end

  def meta_description
    @_meta_description ||= if @article
      truncate(
        strip_tags(::GitHub::Markup::Markdown.new.render(GitHub::Markups::MARKUP_MARKDOWN, @article.body)),
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
      description: meta_description
    }
  end
end
