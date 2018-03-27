class AddDefaultEyeCatchingImageUrlToWeblog < ActiveRecord::Migration[5.1]
  def change
    add_column :weblogs, :default_eye_catching_image_url, :string
  end
end
