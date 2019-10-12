module ArticlesHelper
  def amp_article_url(article, opts = {})
    d = article.published_on

    url_for(
      {
        controller: 'amp/articles',
        action: 'show',
        year: d.year,
        month: '%02d' % d.month,
        day: '%02d' % d.day,
        slug: article.slug,
        format: 'html'
      }.merge(opts)
    )
  end

  def article_url(article, opts = {})
    d = article.published_on

    url_for(
      {
        controller: '/articles',
        action: 'show',
        year: d.year,
        month: '%02d' % d.month,
        day: '%02d' % d.day,
        slug: article.slug,
        format: 'html'
      }.merge(opts)
    )
  end

  def articles_url(year, month = nil, day = nil)
    url_for(
      controller: :articles,
      action: :list,
      year: year,
      month: month ? '%02d' % month : nil,
      day: day ? '%02d' % day : nil,
    )
  end
end
