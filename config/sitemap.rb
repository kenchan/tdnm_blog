SitemapGenerator::Sitemap.default_host = ENV['default_host'] || "http://www.example.com"

SitemapGenerator::Sitemap.create do
  Article.find_each do |a|
    d = a.published_on
    add(
      url_for(
        controller: 'articles',
        action: 'show',
        year: d.year,
        month: '%02d' % d.month,
        day: '%02d' % d.day,
        title: a.url_title,
        format: 'html',
        only_path: true
      ),
      lastmod: a.updated_at
    )
  end
end
