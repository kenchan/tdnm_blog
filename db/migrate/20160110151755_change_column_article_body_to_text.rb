class ChangeColumnArticleBodyToText < ActiveRecord::Migration
  def change
    change_column :articles, :body, :text
  end
end
