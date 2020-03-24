class AddIndexToArticlesPublishedOn < ActiveRecord::Migration[6.0]
  def change
    add_index :articles, :published_on, name: :idx_published_on
  end
end
