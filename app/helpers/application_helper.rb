module ApplicationHelper
  def weblog
    @_weblog ||= Weblog.first
  end

  def default_meta_tags
    {
      site: weblog.title,
      title: @article.try(:title),
      reverse: true
    }
  end
end
