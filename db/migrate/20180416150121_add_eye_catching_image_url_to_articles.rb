class AddEyeCatchingImageUrlToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :eye_catching_image_url, :string, null: false, default: ''
  end
end
