class RenameUrlTitleToSlugOnArticles < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :url_title, :slug
  end
end
