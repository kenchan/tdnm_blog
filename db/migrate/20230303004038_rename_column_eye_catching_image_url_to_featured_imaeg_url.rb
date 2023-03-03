class RenameColumnEyeCatchingImageUrlToFeaturedImaegUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles, :eye_catching_image_url, :featured_image_url
    rename_column :weblogs, :default_eye_catching_image_url, :default_featured_image_url
  end
end
