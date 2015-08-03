class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.datetime :published_at
      t.timestamps null: false
    end
  end
end
