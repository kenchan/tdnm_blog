class ChangeArticlesEyecatchingUrlSize < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :eye_catching_image_url, :string, limit: 1024
  end
end
