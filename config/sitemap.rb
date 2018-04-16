SitemapGenerator::Sitemap.default_host = ENV['DEFAULT_HOST'] || "http://www.example.com"

SitemapGenerator::Sitemap.create do
  Article.published.find_each do |a|
    d = a.published_on
    add(
      url_for(
        controller: 'articles',
        action: 'show',
        year: d.year,
        month: '%02d' % d.month,
        day: '%02d' % d.day,
        slug: a.slug,
        format: 'html',
        only_path: true
      ),
      lastmod: a.updated_at
    )
  end
end
