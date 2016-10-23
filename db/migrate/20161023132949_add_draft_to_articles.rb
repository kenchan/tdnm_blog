class AddDraftToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :draft, :boolean, null: false, default: false
  end
end
