module ArticlesHelper
  def article_url(article, opts = {})
    d = article.published_on

    url_for(
      {
        controller: 'articles',
        action: 'show',
        year: d.year,
        month: '%02d' % d.month,
        day: '%02d' % d.day,
        title: article.url_title,
        format: 'html'
      }.merge(opts)
    )
  end
end
