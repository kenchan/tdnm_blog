class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :url_title, null: false
      t.date :published_on
      t.timestamps null: false
    end
  end
end
