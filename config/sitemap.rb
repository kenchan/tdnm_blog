SitemapGenerator::Sitemap.default_host = ENV['DEFAULT_HOST'] || "http://www.example.com"

SitemapGenerator::Sitemap.create do
  Article.published.find_each do |a|
    d = a.published_on
    add(
      article_path(title: a.title),
      lastmod: a.updated_at
    )
  end
end
