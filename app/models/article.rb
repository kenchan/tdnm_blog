class Article < ActiveRecord::Base
  scope :published, -> { where(draft: false) }
  scope :drafts, -> { where(draft: true) }
end
