class Article < ApplicationRecord
  scope :published, -> { where(draft: false) }
  scope :drafts, -> { where(draft: true) }
end
