module ApplicationHelper
  def weblog
    @_weblog ||= Weblog.first
  end

  def default_meta_tags
    {
      site: weblog.title,
      charset: 'utf-8',
      title: @article.try(:title),
      reverse: true
    }
  end
end
