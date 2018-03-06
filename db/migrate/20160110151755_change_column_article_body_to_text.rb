class ChangeColumnArticleBodyToText < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :body, :text
  end
end
