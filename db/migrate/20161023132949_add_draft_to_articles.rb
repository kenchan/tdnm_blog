class AddDraftToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :draft, :boolean, null: false, default: false
  end
end
