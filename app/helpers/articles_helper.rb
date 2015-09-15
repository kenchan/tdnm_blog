module ArticlesHelper
  def article_url(article)
    d = article.published_on

    url_for(
      controller: 'articles',
      action: 'show',
      year: d.year,
      month: '%02d' % d.month,
      day: '%02d' % d.day,
      title: article.url_title,
      format: 'html',
      only_path: false
    )
  end
end
