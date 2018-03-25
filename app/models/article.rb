class Article < ApplicationRecord
  scope :published, -> { where(draft: false) }
  scope :drafts, -> { where(draft: true) }
  scope :archives, ->(year, month, day) {
    if day
      where(published_on: Date.parse("#{year}/#{month}/#{day}"))
    elsif month
      date = Date.parse("#{year}/#{month}/1")
      where(published_on: date.beginning_of_month...date.end_of_month)
    elsif year
      date = Date.parse("#{year}/1/1")
      where(published_on: date.beginning_of_year...date.end_of_year)
    else
      all
    end
  }
end
