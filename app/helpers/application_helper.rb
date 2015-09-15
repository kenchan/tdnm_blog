module ApplicationHelper
  def weblog
    @_weblog ||= Weblog.first
  end

  def title(article = nil)
    [article.try(:title), weblog.title].compact.join(' - ')
  end
end
