class AddUniqueIndexToArticleTitle < ActiveRecord::Migration[6.1]
  def change
    add_index :articles, :title, unique: true
  end
end

Article.pluck(:title).tally.select {|t, i| i >= 2}.map(&:first).each {|t| Article.where(title: t).each {|a| a.update(title: "#{a.published_on}: #{a.title}") } }
