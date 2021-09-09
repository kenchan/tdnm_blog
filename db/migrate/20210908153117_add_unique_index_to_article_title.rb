class AddUniqueIndexToArticleTitle < ActiveRecord::Migration[6.1]
  def change
    add_index :articles, :title, unique: true
  end
end

