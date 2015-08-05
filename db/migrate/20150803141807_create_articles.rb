class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.date :published_on
      t.timestamps null: false
    end
  end
end
